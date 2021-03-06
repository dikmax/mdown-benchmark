Benchmark for [mdown][]
=======================

Running benchmark in browser
----------------------------

Run:

```bash
pub serve
```

Open `http://localhost:8080/`.

Running benchmark in VM
-----------------------

Run:

```bash
dart bin/run.dart
```

Results
-------

Results below obtained on MacBook Pro 13″, Early 2015, Core i7 3.1 GHz.

### VM Dart 1.21.1

 Lang      |     mdown |   markdown | speedup
-----------|----------:|-----------:|--------:
 cs        |  52041.72 | 122977.13  |  x2.36
 de        |  54147.91 | 65126.85   |  x1.20
 en        |  47566.34 | 45564.37   | *x0.96*
 es        |  47201.23 | 51942.65   |  x1.10
 fr        |  48612.95 | 73125.59   |  x1.50
 it        |  42925.31 | 45364.97   |  x1.06
 ja        |  16307.91 | 221022.61  | x13.55
 ko        |  37739.32 | 182108.66  |  x4.83
 nl        |  45762.75 | 41155.66   | *x0.90*
 pl        |  49951.36 | 87576.25   |  x1.75
 pt-br     |  45646.46 | 62118.47   |  x1.36
 ru        |  54541.44 | 428410.51  |  x7.85
 zh        |  15225.86 | 148467.40  |  x9.75
 zh-tw     |  16155.74 | 148755.89  |  x9.21
 **Total** | 573826.30 | 1723717.01 |**x3.00**

### Chrome 56

 Lang      |      mdown |    markdown |  speedup
-----------|-----------:|------------:|---------:
 cs        |   88995.56 |   842368.52 |   x9.47
 de        |  104106.58 |   864050.00 |   x8.30
 en        |   93736.01 |   653028.04 |   x6.97
 es        |  108201.15 |   663755.56 |   x6.13
 fr        |  108029.34 |   981370.37 |   x9.08
 it        |   92723.08 |   647176.98 |   x6.98
 ja        |   29351.87 |  1105555.56 |  x37.67
 ko        |   59966.78 |  1020425.93 |  x17.02
 nl        |  100564.31 |   644973.28 |   x6.41
 pl        |   91211.37 |   801398.15 |   x8.79
 pt-br     |   99694.42 |   693040.74 |   x6.95
 ru        |   88144.64 |  1662296.30 |  x18.86
 zh        |   26263.33 |   914820.37 |  x34.83
 zh-tw     |   27781.57 |   912129.63 |  x32.83
 **Total** | 1118770.01 | 12406389.42 |**x11.09**

### Safari 10.0.2

 Lang      |      mdown |   markdown | speedup
-----------|-----------:|-----------:|--------:
 cs        |  362292.59 |  630629.63 |  x1.74
 de        |  407889.48 |  330278.99 | *x0.81*
 en        |  363448.15 |  245909.83 | *x0.68*
 es        |  411189.28 |  304671.69 | *x0.74*
 fr        |  403215.74 |  433496.18 |  x1.08
 it        |  360903.97 |  261915.87 | *x0.73*
 ja        |  115563.10 | 1239120.37 | x10.72
 ko        |  231152.12 | 1034351.85 |  x4.47
 nl        |  398137.29 |  240483.48 | *x0.60*
 pl        |  359226.81 |  430291.27 |  x1.20
 pt-br     |  389060.19 |  356201.68 | *x0.92*
 ru        |  345618.52 | 2547500.00 |  x7.37
 zh        |  103836.99 |  818075.93 |  x7.88
 zh-tw     |  109666.77 |  813479.63 |  x7.42
 **Total** | 4361200.98 | 9686406.40 |**x2.22**

### Firefox 51.0

 Lang      |      mdown |   markdown | speedup
-----------|-----------:|-----------:|--------:
 cs        |  167644.99 |  417722.22 |  x2.49
 de        |  185901.86 |  279003.05 |  x1.50
 en        |  180069.64 |  218905.91 |  x1.22
 es        |  220419.13 |  243971.63 |  x1.11
 fr        |  197275.35 |  351856.61 |  x1.78
 it        |  163227.17 |  222395.01 |  x1.36
 ja        |   55145.08 |  983601.85 | x17.84
 ko        |  114918.30 |  833690.74 |  x7.25
 nl        |  180913.49 |  204387.04 |  x1.13
 pl        |  169692.53 |  340680.20 |  x2.01
 pt-br     |  181653.41 |  278591.52 |  x1.53
 ru        |  163220.88 | 1929185.19 | x11.82
 zh        |   48400.31 |  669896.30 | x13.84
 zh-tw     |   51127.69 |  669809.26 | x13.10
 **Total** | 2079609.83 | 7643696.53 |**x3.68**

[mdown]: https://github.com/dikmax/mdown
