import 'dart:typed_data';

import 'package:core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:shared/shared.dart';

class ChatImagePickerPage extends StatefulWidget {
  const ChatImagePickerPage({super.key, this.maxSelection = 9});

  final int maxSelection;

  static Future<List<String>?> show(
    BuildContext context, {
    int maxSelection = 9,
  }) {
    return Navigator.of(context).push<List<String>>(
      MaterialPageRoute(
        builder: (_) => ChatImagePickerPage(maxSelection: maxSelection),
      ),
    );
  }

  @override
  State<ChatImagePickerPage> createState() => _ChatImagePickerPageState();
}

class _ChatImagePickerPageState extends State<ChatImagePickerPage> {
  static const _pageSize = 60;
  static const _loadMoreThreshold = 240.0;

  final _scrollController = ScrollController();
  final _selectedIds = <String>{};
  final _selectedAssets = <String, AssetEntity>{};

  AssetPathEntity? _albumPath;
  List<AssetEntity> _assets = [];
  int _currentPage = 0;
  bool _loading = true;
  bool _loadingMore = false;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _loadInitial();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_hasMore || _loadingMore || _loading) return;
    final position = _scrollController.position;
    if (position.pixels >= position.maxScrollExtent - _loadMoreThreshold) {
      _loadMore();
    }
  }

  Future<void> _loadInitial() async {
    final permission = await PhotoManager.requestPermissionExtend();
    if (!permission.isAuth) {
      if (mounted) setState(() => _loading = false);
      return;
    }

    final paths = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      onlyAll: true,
    );
    if (paths.isEmpty) {
      if (mounted) setState(() => _loading = false);
      return;
    }

    _albumPath = paths.first;
    _currentPage = 0;
    _hasMore = true;
    final assets = await _fetchPage(0);
    if (!mounted) return;
    setState(() {
      _assets = assets;
      _loading = false;
      _hasMore = assets.length >= _pageSize;
      _currentPage = assets.isEmpty ? 0 : 1;
    });
  }

  Future<void> _loadMore() async {
    final album = _albumPath;
    if (album == null || !_hasMore || _loadingMore) return;

    setState(() => _loadingMore = true);
    final assets = await _fetchPage(_currentPage);
    if (!mounted) return;
    setState(() {
      _assets = [..._assets, ...assets];
      _hasMore = assets.length >= _pageSize;
      if (assets.isNotEmpty) _currentPage += 1;
      _loadingMore = false;
    });
  }

  Future<List<AssetEntity>> _fetchPage(int page) async {
    final album = _albumPath;
    if (album == null) return [];
    return album.getAssetListPaged(page: page, size: _pageSize);
  }

  void _toggleAsset(AssetEntity asset) {
    setState(() {
      if (_selectedIds.contains(asset.id)) {
        _selectedIds.remove(asset.id);
        _selectedAssets.remove(asset.id);
        return;
      }
      if (widget.maxSelection == 1) {
        _selectedIds
          ..clear()
          ..add(asset.id);
        _selectedAssets
          ..clear()
          ..[asset.id] = asset;
        return;
      }
      if (_selectedIds.length >= widget.maxSelection) {
        AppToast.error('最多选择${widget.maxSelection}张图片');
        return;
      }
      _selectedIds.add(asset.id);
      _selectedAssets[asset.id] = asset;
    });
  }

  Future<void> _confirm() async {
    if (_selectedIds.isEmpty) {
      AppToast.error('请先选择照片');
      return;
    }

    final paths = <String>[];
    for (final asset in _selectedAssets.values) {
      final file = await asset.file;
      if (file != null) paths.add(file.path);
    }
    if (!mounted) return;
    Navigator.of(context).pop(paths);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('已选 ${_selectedIds.length}/${widget.maxSelection}'),
        actions: [
          TextButton(
            onPressed: _confirm,
            child: const Text(
              '确定',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_assets.isEmpty) {
      return const Center(child: Text('相册暂无图片'));
    }

    final itemCount = _assets.length + (_loadingMore ? 1 : 0);
    return GridView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(2),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        if (index >= _assets.length) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        }
        return _AssetGridItem(
          asset: _assets[index],
          selected: _selectedIds.contains(_assets[index].id),
          onTap: () => _toggleAsset(_assets[index]),
        );
      },
    );
  }
}

class _AssetGridItem extends StatelessWidget {
  const _AssetGridItem({
    required this.asset,
    required this.selected,
    required this.onTap,
  });

  final AssetEntity asset;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _AssetThumbnail(asset: asset),
          if (selected)
            Container(
              color: AppColors.primary.withOpacity(0.35),
              alignment: Alignment.topRight,
              padding: const EdgeInsets.all(6),
              child: Container(
                width: 22,
                height: 22,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 14,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _AssetThumbnail extends StatelessWidget {
  const _AssetThumbnail({required this.asset});

  final AssetEntity asset;

  static const _thumbnailSize = ThumbnailSize.square(200);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: asset.thumbnailDataWithSize(_thumbnailSize),
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (data != null) {
          return Image.memory(data, fit: BoxFit.cover, gaplessPlayback: true);
        }
        return Container(color: AppColors.borderGray);
      },
    );
  }
}
