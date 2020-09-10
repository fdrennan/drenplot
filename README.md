<!-- badges: start -->
[![Travis build status](https://travis-ci.com/fdrennan/drenplot.svg?branch=master)](https://travis-ci.com/fdrennan/drenplot)
[![Codecov test coverage](https://codecov.io/gh/fdrennan/drenplot/branch/master/graph/badge.svg)](https://codecov.io/gh/fdrennan/drenplot?branch=master)
<!-- badges: end -->

```
library(drenplot)
```

```
build_example()
```

```
ggplot2::ggplot(mtcars, aes(x = mpg, y = wt)) +
 dren_scatter(
   title = 'MPG v. WT',
   font ='serif',
   font_size = 30
 )
```
