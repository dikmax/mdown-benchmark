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

 Lang  | mdown    | markdown  | speedup
-------|----------|-----------|--------
 cs    | 59396.32 | 144760.15 | x2.44
 de    | 52958.10 | 68913.31  | x1.30
 en    | 45493.57 | 47836.23  | x1.05
 es    | 44306.89 | 54171.39  | x1.22
 fr    | 47024.80 | 76217.25  | x1.62
 it    | 41339.51 | 47268.53  | x1.14
 ja    | 15700.37 | 229466.60 | x14.62
 ko    | 36818.22 | 187747.28 | x5.10
 nl    | 43469.97 | 42176.90  | *x0.97*
 pl    | 49677.02 | 88276.70  | x1.78
 pt-br | 43815.03 | 63228.64  | x1.44
 ru    | 53243.47 | 445696.03 | x8.37
 zh    | 14718.84 | 155487.81 | x10.56
 zh-tw | 15677.65 | 156832.16 | x10.00
**SUM**| 563639.76|	1808078.98|	**x3.21**

### Chrome 55

 Lang  | mdown     | markdown   | speedup
-------|-----------|------------|---------
 cs    | 95766.81  | 959779.63  | x10.02
 de    | 113180.68 | 948027.78  | x8.38
 en    | 102370.09 | 801444.44  | x7.83
 es    | 113666.97 | 783325.93  | x6.89
 fr    | 113194.14 | 1077611.11 | x9.52
 it    | 98333.22  | 731935.19  | x7.44
 ja    | 30534.09  | 1269425.93 | x41.57
 ko    | 64674.15  | 1255305.56 | x19.41
 nl    | 108677.73 | 738935.19  | x6.80
 pl    | 96405.52  | 923685.19  | x9.58
 pt-br | 104983.66 | 791333.33  | x7.54
 ru    | 94177.92  | 1916074.07 | x20.35
 zh    | 27911.62  | 1054314.81 | x37.77
 zh-tw | 29795.96  | 1062787.04 | x35.67
**SUM**| 1193672.56| 14313985.20| **x11.99**

### Safari 10.0.2

Lang   | mdown     | markdown   | speedup
-------|-----------|------------|---------
 cs    | 354603.72 | 659782.80  | x1.86
 de    | 459072.22 | 420588.60  | x0.92
 en    | 369937.30 | 261659.39  | x0.71
 es    | 423224.07 | 319018.42  | x0.75
 fr    | 431236.24 | 450324.60  | x1.04
 it    | 367571.03 | 272382.70  | x0.74
 ja    | 137403.07 | 1711027.78 | x12.45
 ko    | 323847.10 | 1416500.00 | x4.37
 nl    | 401093.43 | 255068.22  | x0.64
 pl    | 365105.14 | 449428.57  | x1.23
 pt-br | 409659.18 | 381172.22  | x0.93
 ru    | 352817.46 | 2557333.33 | x7.25
 zh    | 97855.06  | 832659.26  | x8.51
 zh-tw | 103167.93 | 826538.89  | x8.01
**SUM**| 4596592,95| 10813484,78| **x2.35**

### Firefox 50.1

 Lang  | mdown     | markdown   | speedup
-------|-----------|------------|---------
 cs    | 187551.90 | 515261.68  | x2.75
 de    | 208194.14 | 284204.91  | x1.38
 en    | 180155.16 | 221179.06  | x1.23
 es    | 221852.03 | 270730.38  | x1.22
 fr    | 226715.01 | 375549.07  | x1.66
 it    | 203264.06 | 252081.87  | x1.24
 ja    | 65643.23  | 1128722.22 | x17.19
 ko    | 117686.90 | 883225.93  | x7.50
 nl    | 204466.27 | 230745.33  | x1.13
 pl    | 175320.66 | 376033.90  | x2.14
 pt-br | 185371.10 | 319147.62  | x1.72
 ru    | 186989.58 | 2131277.78 | x11.40
 zh    | 50819.48  | 747805.56  | x14.71
 zh-tw | 54177.07  | 749620.37  | x13.84
**SUM**| 2268206.59| 8485585.68	| **x3.74**

[mdown]: https://github.com/dikmax/mdown
