# page_indicator_plus


A biblioteca Page Indicator Plus foi desenvolvida como uma alternativa ao pacote descontinuado [flutter_page_ndicator](https://pub.dev/documentation/flutter_page_indicator/latest/). 
Ela fornece uma maneira fácil de adicionar indicadores de página animados em projetos que usam o PageController, facilitando o desenvolvimento com PageViews e similares.

## Instalação
Para instalar a biblioteca, adicione a seguinte dependência em seu arquivo *pubspec.yaml*:

```
dependencies:
  page_indicator_plus: 
```

Em seguida, execute o seguinte comando em seu terminal para instalar a biblioteca:

```flutter pub get```

## Como usar
Para utilizar a biblioteca Page Indicator Plus, você precisará de um PageController e do número total de páginas que você tem.

```

final int _pageCount = 5;
final PageController _pageController = PageController(
  initialPage: 0,
);
```

Em seguida, adicione o widget PageIndicator ao seu widget de exibição de página (por exemplo, um PageView) e configure os parâmetros de acordo com suas necessidades.

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


Os parâmetros de configuração são:

- `controller` (obrigatório): o controlador de página que você está usando para o widget de exibição de página;
- `count` (obrigatório): o número total de páginas;
- `size` (opcional, padrão: 5.0): o tamanho dos indicadores de página;
- `layout` (opcional, padrão: `PageIndicatorLayout.SLIDE`): o layout dos indicadores de página (pode ser `PageIndicatorLayout.NONE`,  `PageIndicatorLayout.DROP`, `PageIndicatorLayout.SLIDE`,  `PageIndicatorLayout.COLOR`, `PageIndicatorLayout.SCALE`, ou `PageIndicatorLayout.WARM`);
- `color` (opcional, padrão: Colors.grey): a cor dos indicadores de página inativos;
- `activeColor` (opcional, padrão: Colors.blue): a cor do indicador de página ativo;
- `scale` (opcional, padrão: 0.6): a escala dos indicadores de página;
- `space` (opcional, padrão: 5.0): o espaço entre os indicadores de página;
- `dropHeight` (opcional, padrão: 20.0): a altura do indicador de página quando layout for `PageIndicatorLayout.DROP`;

## Todos layouts

| Layout  | Showcase   | 
| :------------ |:---------------:|
| PageIndicatorLayout.NONE | ![](./assets/images/indicator1.gif)  
| PageIndicatorLayout.SLIDE | ![](./assets/images/indicator2.gif)  
| PageIndicatorLayout.WARM | ![](./assets/images/warm.gif)  
| PageIndicatorLayout.COLOR | ![](./assets/images/indicator4.gif)  
| PageIndicatorLayout.SCALE | ![](./assets/images/indicator5.gif)  
| PageIndicatorLayout.DROP | ![](./assets/images/indicator7.gif)  

## Contribuindo
Se você encontrar algum problema ou tiver alguma sugestão de melhoria, não hesite em abrir uma issue ou enviar uma pull request para o repositório do GitHub da biblioteca: https://github.com/johnnyCrmall/page_indicator_plus.
