# Page Indicator Plus

The Page Indicator Plus library was developed as an alternative to the deprecated package [flutter_page_indicator](https://pub.dev/documentation/flutter_page_indicator/latest/). It provides an easy way to add animated page indicators in projects that use PageController, making development with PageViews and similar components easier.


## How to Use:
To use the Page Indicator Plus library, you will need a PageController and the total number of pages you have.

```

final int _pageCount = 5;
final PageController _pageController = PageController(
  initialPage: 0,
);
```

Next, add the PageIndicator widget to your page display widget (e.g., a PageView) and configure the parameters according to your needs.

```
PageIndicator(
  controller: _pageController,
  count: _pageCount,
  size: 8,
  layout: PageIndicatorLayout.WARM,
  color: Colors.grey,
  activeColor: Colors.blue,
  scale: 0.65,
  space: 10,
)
```

The configuration parameters are:

- `controller` (required): The page controller you are using for the page display widget;
- `count` (required): the total number of pages.
- `size` (optional, default: 5.0): the size of the page indicators.
- `layout` (optional, default: `PageIndicatorLayout.SLIDE`): the layout of the - page indicators (can be `PageIndicatorLayout.NONE`,  `PageIndicatorLayout.DROP`,  `PageIndicatorLayout.SLIDE `,   `PageIndicatorLayout.COLOR `,  `PageIndicatorLayout.SCALE`, or  `PageIndicatorLayout.WARM `).
- `color` (optional, default: `Colors.grey`): the color of inactive page indicators.
- `activeColor` (optional, `default: Colors.blue`): the color of the active - page indicator.
-   `scale` (optional, default: 0.6): the scale of the page indicators.
-   `space` (optional, default: 5.0): the space between page indicators.
-   `dropHeight` (optional, default: 20.0): the height of the page indicator when layout is `PageIndicatorLayout.DROP`.

## All layouts

| Layout  | Showcase   | 
| :------------ |:---------------:|
| PageIndicatorLayout.NONE | ![](./assets/images/indicator1.gif)  
| PageIndicatorLayout.SLIDE | ![](./assets/images/indicator2.gif)  
| PageIndicatorLayout.WARM | ![](./assets/images/warm.gif)  
| PageIndicatorLayout.COLOR | ![](./assets/images/indicator4.gif)  
| PageIndicatorLayout.SCALE | ![](./assets/images/indicator5.gif)  
| PageIndicatorLayout.DROP | ![](./assets/images/indicator7.gif)  

## Contributing
If you encounter any issues or have suggestions for improvements, please do not hesitate to open an issue or submit a pull request to the GitHub repository of the library https://github.com/johnnyfdev/page_indicator_plus.
