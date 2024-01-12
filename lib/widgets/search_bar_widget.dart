import 'package:flutter/material.dart';
import 'package:pasar_sayur/common/app_colors.dart';
import 'package:pasar_sayur/widgets/custom_text_form_field.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    super.key,
    this.onSearch,
    this.showFilter = false,
    this.onTap,
    this.enabled = true,
    this.isFocused = false,
  });

  final bool isFocused;
  final bool enabled;
  final VoidCallback? onTap;
  final Function(String keyword)? onSearch;
  final bool showFilter;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final _searchController = TextEditingController();
  late bool isFocused;

  @override
  void initState() {
    super.initState();

    _searchController.addListener(() {
      setState(() {
        // widget.onSearch!(_searchController.text);
      });
    });

    isFocused = widget.isFocused;
  }

  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: CustomTextFormField(
                controller: _searchController,
                autofocus: isFocused,
                enabled: widget.enabled,
                onEditingComplete: widget.onSearch != null
                    ? () => widget.onSearch!(_searchController.text)
                    : null,
                onFocusChange: (hasFocus) {
                  setState(() {
                    isFocused = hasFocus;
                  });
                },
                fontSize: 14,
                fillColor: AppColor.cream2,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                prefixIcon: Image.asset(
                  'assets/ic_search_outline.png',
                  width: 18,
                  height: 18,
                  color: AppColor.gray90,
                ),
                hintText: 'Cari sayur atau buah disini...',
              ),
            ),
            if (widget.showFilter)
              const SizedBox(
                width: 8,
              ),
            if (widget.showFilter)
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(10),
                child: Ink(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: isFocused ? AppColor.primary : AppColor.cream2,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/ic_filter.png',
                      width: 24,
                      height: 24,
                      color: isFocused ? AppColor.white : AppColor.primary,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
