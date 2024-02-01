PROC FORMAT;


VALUE AntiguedadVeh

low - 4   = '01. (low, 4]  '   /* exp_sup_DAN : 131145.25 |||||||||||||||||||| s_DANPSinC/exp_sup_DAN : 0.0028 |||||||||||||||||||| c_DANPSinC_descr/s_DANPSinC : 1509.53 ||||||||||||||||     Obs :397500  */
4 - 5     = '02. (4, 5]    '   /* exp_sup_DAN : 34789.41  |||||                s_DANPSinC/exp_sup_DAN : 0.0022 ||||||||||||||||     c_DANPSinC_descr/s_DANPSinC : 1375.04 ||||||||||||||       Obs :113818  */
5 - 6     = '03. (5, 6]    '   /* exp_sup_DAN : 31767.62  |||||                s_DANPSinC/exp_sup_DAN : 0.002  ||||||||||||||       c_DANPSinC_descr/s_DANPSinC : 1942.82 |||||||||||||||||||| Obs :108175  */
6 - 8     = '04. (6, 8]    '   /* exp_sup_DAN : 51634.49  ||||||||             s_DANPSinC/exp_sup_DAN : 0.0014 ||||||||||           c_DANPSinC_descr/s_DANPSinC : 1485.74 |||||||||||||||      Obs :193313  */
8 - 10    = '05. (8, 10]   '   /* exp_sup_DAN : 42957.55  |||||||              s_DANPSinC/exp_sup_DAN : 0.0013 |||||||||            c_DANPSinC_descr/s_DANPSinC : 1558.26 ||||||||||||||||     Obs :186708  */
10 - 11   = '06. (10, 11]  '   /* exp_sup_DAN : 23839.25  ||||                 s_DANPSinC/exp_sup_DAN : 0.001  |||||||              c_DANPSinC_descr/s_DANPSinC : 1297.55 |||||||||||||        Obs :115220  */
11 - 13   = '07. (11, 13]  '   /* exp_sup_DAN : 55018.62  ||||||||             s_DANPSinC/exp_sup_DAN : 0.0008 ||||||               c_DANPSinC_descr/s_DANPSinC : 1391.95 ||||||||||||||       Obs :307885  */
13 - 14   = '08. (13, 14]  '   /* exp_sup_DAN : 27168.8   ||||                 s_DANPSinC/exp_sup_DAN : 0.0007 |||||                c_DANPSinC_descr/s_DANPSinC : 1189.55 ||||||||||||         Obs :176483  */
14 - 15   = '09. (14, 15]  '   /* exp_sup_DAN : 27590.91  ||||                 s_DANPSinC/exp_sup_DAN : 0.0004 |||                  c_DANPSinC_descr/s_DANPSinC : 1262.41 |||||||||||||        Obs :201639  */
15 - high = '10. (15, high]'   /* exp_sup_DAN : 60532.9   |||||||||            s_DANPSinC/exp_sup_DAN : 0.0004 |||                  c_DANPSinC_descr/s_DANPSinC : 1196.21 ||||||||||||         Obs :1343197 */
. = '01. (low, 4]'
;


VALUE AntiguedadCarnet1_

low - 3   = '01. (low, 3]  '   /* exp_sup_DAN : 4728.74                        s_DANPSinC/exp_sup_DAN : 0.0034 |||||||||||||||||||| c_DANPSinC_descr/s_DANPSinC : 949.34  ||||||||||||         Obs :31930   */
3 - 10    = '02. (3, 10]   '   /* exp_sup_DAN : 12064.24  |                    s_DANPSinC/exp_sup_DAN : 0.0025 |||||||||||||||      c_DANPSinC_descr/s_DANPSinC : 1068.64 ||||||||||||||       Obs :73820   */
10 - 17   = '03. (10, 17]  '   /* exp_sup_DAN : 42519.3   ||                   s_DANPSinC/exp_sup_DAN : 0.0019 |||||||||||          c_DANPSinC_descr/s_DANPSinC : 1271.01 ||||||||||||||||     Obs :263213  */
17 - high = '04. (17, high]'   /* exp_sup_DAN : 427132.52 |||||||||||||||||||| s_DANPSinC/exp_sup_DAN : 0.0015 |||||||||            c_DANPSinC_descr/s_DANPSinC : 1560.42 |||||||||||||||||||| Obs :2774975 */
. = 'Missing'
;


VALUE AntiguedadCarnet2_

low - 2   = '01. (low, 2]  '   /* exp_sup_DAN : 5505.88  ||                   s_DANPSinC/exp_sup_DAN : 0.0025 |||||||||||||||||||| c_DANPSinC_descr/s_DANPSinC : 2063.8  |||||||||||||||||||| Obs :38074  */
2 - 5     = '02. (2, 5]    '   /* exp_sup_DAN : 5747.62  ||                   s_DANPSinC/exp_sup_DAN : 0.0021 ||||||||||||||||     c_DANPSinC_descr/s_DANPSinC : 1607.78 ||||||||||||||||     Obs :33110  */
5 - 10    = '03. (5, 10]   '   /* exp_sup_DAN : 8516.28  |||                  s_DANPSinC/exp_sup_DAN : 0.0018 ||||||||||||||       c_DANPSinC_descr/s_DANPSinC : 1631.49 ||||||||||||||||     Obs :48090  */
10 - 15   = '04. (10, 15]  '   /* exp_sup_DAN : 10853.46 |||                  s_DANPSinC/exp_sup_DAN : 0.0017 |||||||||||||        c_DANPSinC_descr/s_DANPSinC : 1762.22 |||||||||||||||||    Obs :61222  */
15 - high = '05. (15, high]'   /* exp_sup_DAN : 64219    |||||||||||||||||||| s_DANPSinC/exp_sup_DAN : 0.0014 |||||||||||          c_DANPSinC_descr/s_DANPSinC : 1710.5  |||||||||||||||||    Obs :332943 */
. = 'Sin Segundo conductor'
;


VALUE CapitalFallecimiento

low - 6000    = '01. (low, 6000]   '   /* exp_sup_DAN : 46221.58  |||                  s_DANPSinC/exp_sup_DAN : 0.001  |||||||||            c_DANPSinC_descr/s_DANPSinC : 1414.12 |||||||||||||||      Obs :379454  */
6000 - 12000  = '02. (6000, 12000] '   /* exp_sup_DAN : 36232.55  |||                  s_DANPSinC/exp_sup_DAN : 0.0014 |||||||||||||        c_DANPSinC_descr/s_DANPSinC : 1548.52 |||||||||||||||||    Obs :240099  */
12000 - 18000 = '03. (12000, 18000]'   /* exp_sup_DAN : 92922.64  |||||||              s_DANPSinC/exp_sup_DAN : 0.0021 |||||||||||||||||||| c_DANPSinC_descr/s_DANPSinC : 1260.1  |||||||||||||        Obs :666319  */
18000 - 24000 = '04. (18000, 24000]'   /* exp_sup_DAN : 25326.44  ||                   s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||||      c_DANPSinC_descr/s_DANPSinC : 1876.12 |||||||||||||||||||| Obs :147928  */
24000 - 30000 = '05. (24000, 30000]'   /* exp_sup_DAN : 270305.48 |||||||||||||||||||| s_DANPSinC/exp_sup_DAN : 0.0015 ||||||||||||||       c_DANPSinC_descr/s_DANPSinC : 1562.64 |||||||||||||||||    Obs :1623568 */
30000 - high  = '06. (30000, high] '   /* exp_sup_DAN : 15431.65  |                    s_DANPSinC/exp_sup_DAN : 0.0017 ||||||||||||||||     c_DANPSinC_descr/s_DANPSinC : 1761.45 |||||||||||||||||||  Obs :85651   */
. = 'Missing'
;


VALUE CilindradaVeh

low - 1460  = '01. (low, 1460] '   /* exp_sup_DAN : 118029.43 ||||||||||           s_DANPSinC/exp_sup_DAN : 0.0014 |||||||||||||||      c_DANPSinC_descr/s_DANPSinC : 1616.8  |||||||||||||||||||| Obs :718552  */
1460 - 1970 = '02. (1460, 1970]'   /* exp_sup_DAN : 237374.71 |||||||||||||||||||| s_DANPSinC/exp_sup_DAN : 0.0016 ||||||||||||||||||   c_DANPSinC_descr/s_DANPSinC : 1484.77 ||||||||||||||||||   Obs :1524797 */
1970 - high = '03. (1970, high]'   /* exp_sup_DAN : 129781.62 |||||||||||          s_DANPSinC/exp_sup_DAN : 0.0018 |||||||||||||||||||| c_DANPSinC_descr/s_DANPSinC : 1454.86 ||||||||||||||||||   Obs :894074  */
. = '03. (1970, high]'
;


VALUE CZScore

low - 100  = '01. (low, 100] '   /* exp_sup_DAN : 39462.81  ||||||               s_DANPSinC/exp_sup_DAN : 0.0009 ||||||               c_DANPSinC_descr/s_DANPSinC : 1309.67 ||||||||||||||||     Obs :207095 */
100 - 280  = '02. (100, 280] '   /* exp_sup_DAN : 127194.99 |||||||||||||||||||| s_DANPSinC/exp_sup_DAN : 0.0016 ||||||||||           c_DANPSinC_descr/s_DANPSinC : 1607.92 |||||||||||||||||||| Obs :510579 */
280 - 400  = '03. (280, 400] '   /* exp_sup_DAN : 30962.4   |||||                s_DANPSinC/exp_sup_DAN : 0.0017 |||||||||||          c_DANPSinC_descr/s_DANPSinC : 1450.23 ||||||||||||||||||   Obs :100330 */
400 - 590  = '04. (400, 590] '   /* exp_sup_DAN : 31135.41  |||||                s_DANPSinC/exp_sup_DAN : 0.0021 |||||||||||||        c_DANPSinC_descr/s_DANPSinC : 1473.96 ||||||||||||||||||   Obs :103144 */
590 - 820  = '05. (590, 820] '   /* exp_sup_DAN : 32837.43  |||||                s_DANPSinC/exp_sup_DAN : 0.0025 ||||||||||||||||     c_DANPSinC_descr/s_DANPSinC : 1571.34 |||||||||||||||||||| Obs :102550 */
820 - high = '06. (820, high]'   /* exp_sup_DAN : 70760.35  |||||||||||          s_DANPSinC/exp_sup_DAN : 0.0032 |||||||||||||||||||| c_DANPSinC_descr/s_DANPSinC : 1471.33 ||||||||||||||||||   Obs :205633 */
. = 'Sin Info'
;


VALUE EdadConductor1_

low - 25  = '01. (low, 25] '   /* exp_sup_DAN : 4259.4                         s_DANPSinC/exp_sup_DAN : 0.0045 |||||||||||||||||||| c_DANPSinC_descr/s_DANPSinC : 1005.96 |||||||||||||        Obs :28035   */
25 - 27   = '02. (25, 27]  '   /* exp_sup_DAN : 2207.21                        s_DANPSinC/exp_sup_DAN : 0.0032 ||||||||||||||       c_DANPSinC_descr/s_DANPSinC : 1221.44 ||||||||||||||||     Obs :13269   */
27 - 30   = '03. (27, 30]  '   /* exp_sup_DAN : 4535.63                        s_DANPSinC/exp_sup_DAN : 0.0026 ||||||||||||         c_DANPSinC_descr/s_DANPSinC : 1399.84 ||||||||||||||||||   Obs :25129   */
30 - 33   = '04. (30, 33]  '   /* exp_sup_DAN : 9375.09   |                    s_DANPSinC/exp_sup_DAN : 0.0019 |||||||||            c_DANPSinC_descr/s_DANPSinC : 1402.26 ||||||||||||||||||   Obs :50986   */
33 - 60   = '05. (33, 60]  '   /* exp_sup_DAN : 304737.97 |||||||||||||||||||| s_DANPSinC/exp_sup_DAN : 0.0017 |||||||              c_DANPSinC_descr/s_DANPSinC : 1508.33 |||||||||||||||||||| Obs :1856077 */
60 - high = '06. (60, high]'   /* exp_sup_DAN : 161329.51 |||||||||||          s_DANPSinC/exp_sup_DAN : 0.0013 ||||||               c_DANPSinC_descr/s_DANPSinC : 1541.13 |||||||||||||||||||| Obs :1170442 */
. = 'Missing'
;


VALUE EdadConductor2_

low - 27  = '01. (low, 27] '   /* exp_sup_DAN : 13612.83 ||||                 s_DANPSinC/exp_sup_DAN : 0.0023 |||||||||||||||||||| c_DANPSinC_descr/s_DANPSinC : 1721.92 |||||||||||||||||||  Obs :82138  */
27 - 58   = '02. (27, 58]  '   /* exp_sup_DAN : 64625.67 |||||||||||||||||||| s_DANPSinC/exp_sup_DAN : 0.0015 ||||||||||||||       c_DANPSinC_descr/s_DANPSinC : 1778.11 |||||||||||||||||||| Obs :335815 */
58 - high = '03. (58, high]'   /* exp_sup_DAN : 16599.76 |||||                s_DANPSinC/exp_sup_DAN : 0.0011 ||||||||||           c_DANPSinC_descr/s_DANPSinC : 1507.38 |||||||||||||||||    Obs :95473  */
. = 'Sin Segundo conductor'
;


VALUE NumeroADAS

low - 0   = '01. (low, 0]  '   /* exp_sup_DAN : 10366.22 ||                   s_DANPSinC/exp_sup_DAN : 0.0007 ||||                 c_DANPSinC_descr/s_DANPSinC : 1117.02 ||||||||||||||       Obs :64873  */
0 - 1     = '02. (0, 1]    '   /* exp_sup_DAN : 39736.29 |||||||||            s_DANPSinC/exp_sup_DAN : 0.0011 ||||||               c_DANPSinC_descr/s_DANPSinC : 1394.24 |||||||||||||||||    Obs :194136 */
1 - 2     = '03. (1, 2]    '   /* exp_sup_DAN : 31012.45 |||||||              s_DANPSinC/exp_sup_DAN : 0.0014 |||||||              c_DANPSinC_descr/s_DANPSinC : 1554.48 |||||||||||||||||||  Obs :133357 */
2 - 4     = '04. (2, 4]    '   /* exp_sup_DAN : 66360.91 ||||||||||||||||     s_DANPSinC/exp_sup_DAN : 0.0017 |||||||||            c_DANPSinC_descr/s_DANPSinC : 1563.39 |||||||||||||||||||  Obs :258949 */
4 - 5     = '05. (4, 5]    '   /* exp_sup_DAN : 32363.61 ||||||||             s_DANPSinC/exp_sup_DAN : 0.002  |||||||||||          c_DANPSinC_descr/s_DANPSinC : 1643.27 |||||||||||||||||||| Obs :116364 */
5 - 6     = '06. (5, 6]    '   /* exp_sup_DAN : 30913.84 |||||||              s_DANPSinC/exp_sup_DAN : 0.0022 ||||||||||||         c_DANPSinC_descr/s_DANPSinC : 1527.19 |||||||||||||||||||  Obs :102065 */
6 - 12    = '07. (6, 12]   '   /* exp_sup_DAN : 84090.05 |||||||||||||||||||| s_DANPSinC/exp_sup_DAN : 0.0025 |||||||||||||        c_DANPSinC_descr/s_DANPSinC : 1546.69 |||||||||||||||||||  Obs :251168 */
12 - 15   = '08. (12, 15]  '   /* exp_sup_DAN : 20424.19 |||||                s_DANPSinC/exp_sup_DAN : 0.0027 ||||||||||||||       c_DANPSinC_descr/s_DANPSinC : 1606.91 |||||||||||||||||||| Obs :59014  */
15 - high = '09. (15, high]'   /* exp_sup_DAN : 17085.84 ||||                 s_DANPSinC/exp_sup_DAN : 0.0038 |||||||||||||||||||| c_DANPSinC_descr/s_DANPSinC : 1209.37 |||||||||||||||      Obs :49405  */
. = 'Sin Info'
;


VALUE NumHabitantes

low - 700      = '01. (low, 700]     '   /* exp_sup_DAN : 43435.9  |||||||||||||||||    s_DANPSinC/exp_sup_DAN : 0.0015 |||||||||||||||||    c_DANPSinC_descr/s_DANPSinC : 1664.07 ||||||||||||||||||   Obs :329735 */
700 - 1500     = '02. (700, 1500]    '   /* exp_sup_DAN : 40732.38 ||||||||||||||||     s_DANPSinC/exp_sup_DAN : 0.0015 ||||||||||||||||||   c_DANPSinC_descr/s_DANPSinC : 1629.41 |||||||||||||||||    Obs :291316 */
1500 - 2900    = '03. (1500, 2900]   '   /* exp_sup_DAN : 43035.12 |||||||||||||||||    s_DANPSinC/exp_sup_DAN : 0.0013 ||||||||||||||||     c_DANPSinC_descr/s_DANPSinC : 1440    |||||||||||||||      Obs :304086 */
2900 - 5800    = '04. (2900, 5800]   '   /* exp_sup_DAN : 48062.72 |||||||||||||||||||  s_DANPSinC/exp_sup_DAN : 0.0014 ||||||||||||||||     c_DANPSinC_descr/s_DANPSinC : 1735.08 |||||||||||||||||||  Obs :321771 */
5800 - 11600   = '05. (5800, 11600]  '   /* exp_sup_DAN : 48953.59 |||||||||||||||||||  s_DANPSinC/exp_sup_DAN : 0.0017 |||||||||||||||||||| c_DANPSinC_descr/s_DANPSinC : 1613.77 |||||||||||||||||    Obs :304787 */
11600 - 23500  = '06. (11600, 23500] '   /* exp_sup_DAN : 48870.64 |||||||||||||||||||  s_DANPSinC/exp_sup_DAN : 0.0015 ||||||||||||||||||   c_DANPSinC_descr/s_DANPSinC : 1418.72 |||||||||||||||      Obs :312439 */
23500 - 55500  = '07. (23500, 55500] '   /* exp_sup_DAN : 49450.14 |||||||||||||||||||  s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||||||||  c_DANPSinC_descr/s_DANPSinC : 1865.66 |||||||||||||||||||| Obs :310203 */
55500 - 153300 = '08. (55500, 153300]'   /* exp_sup_DAN : 51434.46 |||||||||||||||||||| s_DANPSinC/exp_sup_DAN : 0.0012 ||||||||||||||       c_DANPSinC_descr/s_DANPSinC : 1196.84 |||||||||||||        Obs :312253 */
153300 - high  = '09. (153300, high] '   /* exp_sup_DAN : 51375.29 |||||||||||||||||||| s_DANPSinC/exp_sup_DAN : 0.0014 ||||||||||||||||     c_DANPSinC_descr/s_DANPSinC : 1563.41 |||||||||||||||||    Obs :302754 */
. = 'Missing'
;


VALUE PrecioFrancoFabricaVeh

low - 12700   = '01. (low, 12700]  '   /* exp_sup_DAN : 68634.4   ||||||||||||         s_DANPSinC/exp_sup_DAN : 0.0007 ||||||               c_DANPSinC_descr/s_DANPSinC : 1398.01 |||||||||||||||||    Obs :834021 */
12700 - 14900 = '02. (12700, 14900]'   /* exp_sup_DAN : 50428.37  |||||||||            s_DANPSinC/exp_sup_DAN : 0.0012 ||||||||||           c_DANPSinC_descr/s_DANPSinC : 1460.28 |||||||||||||||||    Obs :415324 */
14900 - 18400 = '03. (14900, 18400]'   /* exp_sup_DAN : 96555.37  ||||||||||||||||     s_DANPSinC/exp_sup_DAN : 0.0014 |||||||||||          c_DANPSinC_descr/s_DANPSinC : 1480.33 ||||||||||||||||||   Obs :634432 */
18400 - 23400 = '04. (18400, 23400]'   /* exp_sup_DAN : 117788.76 |||||||||||||||||||| s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||        c_DANPSinC_descr/s_DANPSinC : 1552.83 ||||||||||||||||||   Obs :628605 */
23400 - 26300 = '05. (23400, 26300]'   /* exp_sup_DAN : 46845.59  ||||||||             s_DANPSinC/exp_sup_DAN : 0.0018 |||||||||||||||      c_DANPSinC_descr/s_DANPSinC : 1684.14 |||||||||||||||||||| Obs :209384 */
26300 - high  = '06. (26300, high] '   /* exp_sup_DAN : 51634.61  |||||||||            s_DANPSinC/exp_sup_DAN : 0.0024 |||||||||||||||||||| c_DANPSinC_descr/s_DANPSinC : 1337.4  ||||||||||||||||     Obs :211519 */
. = '06. (26300, high]'
;


VALUE RelPesoPotenciaVeh

low - 8   = '01. (low, 8]  '   /* exp_sup_DAN : 43298.76 |||||                s_DANPSinC/exp_sup_DAN : 0.0025 |||||||||||||||||||| c_DANPSinC_descr/s_DANPSinC : 1237.07 ||||||||||||||       Obs :188034 */
8 - 9     = '02. (8, 9]    '   /* exp_sup_DAN : 55023.09 ||||||               s_DANPSinC/exp_sup_DAN : 0.002  ||||||||||||||||     c_DANPSinC_descr/s_DANPSinC : 1789.33 |||||||||||||||||||| Obs :250062 */
9 - 10    = '03. (9, 10]   '   /* exp_sup_DAN : 83950.16 ||||||||||           s_DANPSinC/exp_sup_DAN : 0.0018 ||||||||||||||       c_DANPSinC_descr/s_DANPSinC : 1460.67 ||||||||||||||||     Obs :411868 */
10 - 12   = '04. (10, 12]  '   /* exp_sup_DAN : 173450.9 |||||||||||||||||||| s_DANPSinC/exp_sup_DAN : 0.0015 ||||||||||||         c_DANPSinC_descr/s_DANPSinC : 1530.88 |||||||||||||||||    Obs :984651 */
12 - 13   = '05. (12, 13]  '   /* exp_sup_DAN : 42147.29 |||||                s_DANPSinC/exp_sup_DAN : 0.0012 ||||||||||           c_DANPSinC_descr/s_DANPSinC : 1589.92 ||||||||||||||||||   Obs :309246 */
13 - high = '06. (13, high]'   /* exp_sup_DAN : 87769.2  ||||||||||           s_DANPSinC/exp_sup_DAN : 0.001  ||||||||             c_DANPSinC_descr/s_DANPSinC : 1361.92 |||||||||||||||      Obs :990363 */
. = 'Missing'
;


VALUE TaraVeh

low - 1000  = '01. (low, 1000] '   /* exp_sup_DAN : 26729.78  ||                   s_DANPSinC/exp_sup_DAN : 0.0007 |||||||              c_DANPSinC_descr/s_DANPSinC : 1367.8  |||||||||||||||||    Obs :336981  */
1000 - 1200 = '02. (1000, 1200]'   /* exp_sup_DAN : 100178.18 |||||||||            s_DANPSinC/exp_sup_DAN : 0.0013 ||||||||||||         c_DANPSinC_descr/s_DANPSinC : 1372.3  |||||||||||||||||    Obs :780336  */
1200 - 1500 = '03. (1200, 1500]'   /* exp_sup_DAN : 222001.07 |||||||||||||||||||| s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||||      c_DANPSinC_descr/s_DANPSinC : 1612.83 |||||||||||||||||||| Obs :1277749 */
1500 - high = '04. (1500, high]'   /* exp_sup_DAN : 96066.3   |||||||||            s_DANPSinC/exp_sup_DAN : 0.0021 |||||||||||||||||||| c_DANPSinC_descr/s_DANPSinC : 1376.69 |||||||||||||||||    Obs :481036  */
. = '04. (1500, high]'
;


VALUE ValAccSonido

low - 0       = '01. (low, 0]      '   /* exp_sup_DAN : 463692.43 |||||||||||||||||||| Obs :3067512 */
0 - 2000      = '02. (0, 2000]     '   /* exp_sup_DAN : 19431.07  |                    Obs :67191   */
2000 - 5000   = '03. (2000, 5000]  '   /* exp_sup_DAN : 2989.4                         Obs :8295    */
5000 - 10000  = '04. (5000, 10000] '   /* exp_sup_DAN : 312.45                         Obs :890     */
10000 - 15000 = '05. (10000, 15000]'   /* exp_sup_DAN : 16.27                          Obs :43      */
15000 - high  = '06. (15000, high] '   /* exp_sup_DAN : 3.2                            Obs :7       */
. = 'Missing'
;


VALUE ValorTVeh

low - 15400   = '01. (low, 15400]  '   /* exp_sup_DAN : 61301.3   |||||||||||          s_DANPSinC/exp_sup_DAN : 0.0007 |||||                c_DANPSinC_descr/s_DANPSinC : 1451.43 |||||||||||||||||||  Obs :760433 */
15400 - 19500 = '02. (15400, 19500]'   /* exp_sup_DAN : 78552.21  ||||||||||||||       s_DANPSinC/exp_sup_DAN : 0.0012 |||||||||            c_DANPSinC_descr/s_DANPSinC : 1439.69 |||||||||||||||||||  Obs :622385 */
19500 - 22000 = '03. (19500, 22000]'   /* exp_sup_DAN : 56388.33  ||||||||||           s_DANPSinC/exp_sup_DAN : 0.0014 |||||||||||          c_DANPSinC_descr/s_DANPSinC : 1544.19 |||||||||||||||||||| Obs :383746 */
22000 - 27700 = '04. (22000, 27700]'   /* exp_sup_DAN : 113666.35 |||||||||||||||||||| s_DANPSinC/exp_sup_DAN : 0.0016 ||||||||||||         c_DANPSinC_descr/s_DANPSinC : 1527.83 |||||||||||||||||||| Obs :625880 */
27700 - 38100 = '05. (27700, 38100]'   /* exp_sup_DAN : 112298.65 |||||||||||||||||||| s_DANPSinC/exp_sup_DAN : 0.0018 ||||||||||||||       c_DANPSinC_descr/s_DANPSinC : 1481.33 |||||||||||||||||||  Obs :500377 */
38100 - high  = '06. (38100, high] '   /* exp_sup_DAN : 64237.5   |||||||||||          s_DANPSinC/exp_sup_DAN : 0.0026 |||||||||||||||||||| c_DANPSinC_descr/s_DANPSinC : 1507.69 |||||||||||||||||||| Obs :251034 */
. = 'Missing'
;


VALUE VelocidadVeh

low - 0    = '01. (low, 0]   '   /* exp_sup_DAN : 15168.96  ||                   s_DANPSinC/exp_sup_DAN : 0.001  |||||||              c_DANPSinC_descr/s_DANPSinC : 1316.1  ||||||||||||||||     Obs :128276 */
0 - 140    = '02. (0, 140]   '   /* exp_sup_DAN : 3855.39   |                    s_DANPSinC/exp_sup_DAN : 0.0003 ||                   c_DANPSinC_descr/s_DANPSinC : 71.3    |                    Obs :105050 */
140 - 155  = '03. (140, 155] '   /* exp_sup_DAN : 18532.65  |||                  s_DANPSinC/exp_sup_DAN : 0.0007 |||||                c_DANPSinC_descr/s_DANPSinC : 1130.06 ||||||||||||||       Obs :277319 */
155 - 160  = '04. (155, 160] '   /* exp_sup_DAN : 19787.16  |||                  s_DANPSinC/exp_sup_DAN : 0.001  |||||||              c_DANPSinC_descr/s_DANPSinC : 1651.78 |||||||||||||||||||| Obs :198811 */
160 - 170  = '05. (160, 170] '   /* exp_sup_DAN : 59079.26  ||||||||             s_DANPSinC/exp_sup_DAN : 0.0013 |||||||||            c_DANPSinC_descr/s_DANPSinC : 1366.94 |||||||||||||||||    Obs :436680 */
170 - 180  = '06. (170, 180] '   /* exp_sup_DAN : 84054.85  |||||||||||          s_DANPSinC/exp_sup_DAN : 0.0014 ||||||||||           c_DANPSinC_descr/s_DANPSinC : 1482.28 ||||||||||||||||||   Obs :543364 */
180 - 190  = '07. (180, 190] '   /* exp_sup_DAN : 105571.31 ||||||||||||||       s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||          c_DANPSinC_descr/s_DANPSinC : 1490.16 ||||||||||||||||||   Obs :561981 */
190 - 220  = '08. (190, 220] '   /* exp_sup_DAN : 147631.87 |||||||||||||||||||| s_DANPSinC/exp_sup_DAN : 0.0019 ||||||||||||||       c_DANPSinC_descr/s_DANPSinC : 1631.83 |||||||||||||||||||| Obs :748251 */
220 - high = '09. (220, high]'   /* exp_sup_DAN : 23137.67  |||                  s_DANPSinC/exp_sup_DAN : 0.0028 |||||||||||||||||||| c_DANPSinC_descr/s_DANPSinC : 1116.98 ||||||||||||||       Obs :102650 */
. = '01. (low, 0]'
;


VALUE ViaDelanteraVeh

low - 1440  = '01. (low, 1440] '   /* exp_sup_DAN : 37207.36  ||||||               s_DANPSinC/exp_sup_DAN : 0.0003 |||                  c_DANPSinC_descr/s_DANPSinC : 992.17  ||||||||||||         Obs :670452 */
1440 - 1510 = '02. (1440, 1510]'   /* exp_sup_DAN : 131829.27 |||||||||||||||||||| s_DANPSinC/exp_sup_DAN : 0.0012 ||||||||||           c_DANPSinC_descr/s_DANPSinC : 1436.02 |||||||||||||||||    Obs :994496 */
1510 - 1540 = '03. (1510, 1540]'   /* exp_sup_DAN : 96175.34  |||||||||||||||      s_DANPSinC/exp_sup_DAN : 0.0014 ||||||||||||         c_DANPSinC_descr/s_DANPSinC : 1531.66 ||||||||||||||||||   Obs :566505 */
1540 - 1560 = '04. (1540, 1560]'   /* exp_sup_DAN : 79238.38  ||||||||||||         s_DANPSinC/exp_sup_DAN : 0.0019 ||||||||||||||||     c_DANPSinC_descr/s_DANPSinC : 1691.83 |||||||||||||||||||| Obs :304938 */
1560 - 1570 = '05. (1560, 1570]'   /* exp_sup_DAN : 28954.06  ||||                 s_DANPSinC/exp_sup_DAN : 0.0021 ||||||||||||||||||   c_DANPSinC_descr/s_DANPSinC : 1445.96 |||||||||||||||||    Obs :105649 */
1570 - high = '06. (1570, high]'   /* exp_sup_DAN : 95698.28  |||||||||||||||      s_DANPSinC/exp_sup_DAN : 0.0024 |||||||||||||||||||| c_DANPSinC_descr/s_DANPSinC : 1439.42 |||||||||||||||||    Obs :398787 */
. = '01. (low, 1440]'
;


VALUE AnchoNeumaticoVeh

low - 160  = '01. (low, 160] '   /* exp_sup_DAN : 4434.3                         s_DANPSinC/exp_sup_DAN : 0.0002 |||                  c_DANPSinC_descr/s_DANPSinC : 2535.27 |||||||||||||||||||| Obs :119777 */
160 - 180  = '02. (160, 180] '   /* exp_sup_DAN : 27855.29  |||                  s_DANPSinC/exp_sup_DAN : 0.0008 ||||||||||           c_DANPSinC_descr/s_DANPSinC : 887.7   |||||||              Obs :385982 */
180 - 200  = '03. (180, 200] '   /* exp_sup_DAN : 114244.69 |||||||||||          s_DANPSinC/exp_sup_DAN : 0.0012 ||||||||||||||       c_DANPSinC_descr/s_DANPSinC : 1430.81 |||||||||||          Obs :946211 */
200 - high = '04. (200, high]'   /* exp_sup_DAN : 200159    |||||||||||||||||||| s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||||||||| c_DANPSinC_descr/s_DANPSinC : 1525.13 ||||||||||||         Obs :993890 */
. = '01. (low, 160]'
;


VALUE Aceleracion0_100Veh

low - 0   = '01. (low, 0]  '   /* exp_sup_DAN : 43207.63  |||||||||            s_DANPSinC/exp_sup_DAN : 0.0009 ||||||||             c_DANPSinC_descr/s_DANPSinC : 1513.6  |||||||||||||||||||  Obs :462056 */
0 - 9     = '02. (0, 9]    '   /* exp_sup_DAN : 63819.2   |||||||||||||        s_DANPSinC/exp_sup_DAN : 0.0023 |||||||||||||||||||| c_DANPSinC_descr/s_DANPSinC : 1431.82 ||||||||||||||||||   Obs :252494 */
9 - 10    = '03. (9, 10]   '   /* exp_sup_DAN : 67112.94  |||||||||||||        s_DANPSinC/exp_sup_DAN : 0.0021 ||||||||||||||||||   c_DANPSinC_descr/s_DANPSinC : 1551.98 |||||||||||||||||||  Obs :303323 */
10 - 11   = '04. (10, 11]  '   /* exp_sup_DAN : 90185.64  ||||||||||||||||||   s_DANPSinC/exp_sup_DAN : 0.0018 ||||||||||||||||     c_DANPSinC_descr/s_DANPSinC : 1591.79 |||||||||||||||||||| Obs :467000 */
11 - 12   = '05. (11, 12]  '   /* exp_sup_DAN : 84638.35  |||||||||||||||||    s_DANPSinC/exp_sup_DAN : 0.0016 ||||||||||||||       c_DANPSinC_descr/s_DANPSinC : 1485.8  |||||||||||||||||||  Obs :467447 */
12 - 14   = '06. (12, 14]  '   /* exp_sup_DAN : 101597.06 |||||||||||||||||||| s_DANPSinC/exp_sup_DAN : 0.0012 ||||||||||           c_DANPSinC_descr/s_DANPSinC : 1438.01 ||||||||||||||||||   Obs :699870 */
14 - high = '07. (14, high]'   /* exp_sup_DAN : 28701.57  ||||||               s_DANPSinC/exp_sup_DAN : 0.0007 ||||||               c_DANPSinC_descr/s_DANPSinC : 1317.82 |||||||||||||||||    Obs :305880 */
. = '06. (12, 14]'
;


VALUE LogitudMVeh

low - 4000  = '01. (low, 4000] '   /* exp_sup_DAN : 65702.21  |||||||||||          s_DANPSinC/exp_sup_DAN : 0.0009 ||||||||||           c_DANPSinC_descr/s_DANPSinC : 1153.43 |||||||||||||||      Obs :617748 */
4000 - 4290 = '02. (4000, 4290]'   /* exp_sup_DAN : 124953.07 |||||||||||||||||||| s_DANPSinC/exp_sup_DAN : 0.0014 ||||||||||||||||     c_DANPSinC_descr/s_DANPSinC : 1537    |||||||||||||||||||| Obs :895384 */
4290 - 4480 = '03. (4290, 4480]'   /* exp_sup_DAN : 124825.95 |||||||||||||||||||| s_DANPSinC/exp_sup_DAN : 0.0017 |||||||||||||||||||  c_DANPSinC_descr/s_DANPSinC : 1547.35 |||||||||||||||||||| Obs :623497 */
4480 - high = '04. (4480, high]'   /* exp_sup_DAN : 111866.64 ||||||||||||||||||   s_DANPSinC/exp_sup_DAN : 0.0018 |||||||||||||||||||| c_DANPSinC_descr/s_DANPSinC : 1531.43 |||||||||||||||||||| Obs :621368 */
. = '04. (4480, high]'
;


VALUE DiasGrabacionEfecto

low - 7   = '01. (low, 7]  '   /* exp_sup_DAN : 303764    |||||||||||||||||||| s_DANPSinC/exp_sup_DAN : 0.0017 |||||||||||||||||||| c_DANPSinC_descr/s_DANPSinC : 1456.69 ||||||||||||||||||   Obs :1968405 */
7 - 14    = '02. (7, 14]   '   /* exp_sup_DAN : 24506.82  ||                   s_DANPSinC/exp_sup_DAN : 0.0016 ||||||||||||||||||   c_DANPSinC_descr/s_DANPSinC : 1401.6  |||||||||||||||||    Obs :147958  */
14 - high = '03. (14, high]'   /* exp_sup_DAN : 157185.38 ||||||||||           s_DANPSinC/exp_sup_DAN : 0.0014 |||||||||||||||||    c_DANPSinC_descr/s_DANPSinC : 1610.72 |||||||||||||||||||| Obs :1017840 */
. = '03. (14, high]'
;


VALUE PotenciaVeh

low - 70   = '01. (low, 70]  '   /* exp_sup_DAN : 29011.08  |||||                s_DANPSinC/exp_sup_DAN : 0.0005 |||||                c_DANPSinC_descr/s_DANPSinC : 1203.3  |||||||||||||||      Obs :429542 */
70 - 80    = '02. (70, 80]   '   /* exp_sup_DAN : 25242.65  |||||                s_DANPSinC/exp_sup_DAN : 0.001  ||||||||             c_DANPSinC_descr/s_DANPSinC : 1365.77 ||||||||||||||||     Obs :266347 */
80 - 90    = '03. (80, 90]   '   /* exp_sup_DAN : 56136.6   ||||||||||           s_DANPSinC/exp_sup_DAN : 0.0013 |||||||||||          c_DANPSinC_descr/s_DANPSinC : 1550.08 |||||||||||||||||||  Obs :433450 */
90 - 110   = '04. (90, 110]  '   /* exp_sup_DAN : 110954.69 |||||||||||||||||||| s_DANPSinC/exp_sup_DAN : 0.0014 ||||||||||||         c_DANPSinC_descr/s_DANPSinC : 1405.18 |||||||||||||||||    Obs :751853 */
110 - 120  = '05. (110, 120] '   /* exp_sup_DAN : 57290.71  ||||||||||           s_DANPSinC/exp_sup_DAN : 0.0016 ||||||||||||||       c_DANPSinC_descr/s_DANPSinC : 1582.63 |||||||||||||||||||  Obs :307067 */
120 - 140  = '06. (120, 140] '   /* exp_sup_DAN : 90038.35  ||||||||||||||||     s_DANPSinC/exp_sup_DAN : 0.0017 |||||||||||||||      c_DANPSinC_descr/s_DANPSinC : 1658.81 |||||||||||||||||||| Obs :454174 */
140 - 150  = '07. (140, 150] '   /* exp_sup_DAN : 47296.54  |||||||||            s_DANPSinC/exp_sup_DAN : 0.0021 |||||||||||||||||||  c_DANPSinC_descr/s_DANPSinC : 1426.19 |||||||||||||||||    Obs :199295 */
150 - high = '08. (150, high]'   /* exp_sup_DAN : 70436.47  |||||||||||||        s_DANPSinC/exp_sup_DAN : 0.0023 |||||||||||||||||||| c_DANPSinC_descr/s_DANPSinC : 1452.19 ||||||||||||||||||   Obs :300550 */
. = '01. (low, 70]'
;


VALUE AntiguedadPoliza2_

low - 3   = '01. (low, 3]  '   /* exp_sup_DAN : 273340.34 |||||||||||||||||||| s_DANPSinC/exp_sup_DAN : 0.0018 |||||||||||||||||||| c_DANPSinC_descr/s_DANPSinC : 1454.6  ||||||||||||||||||   Obs :1633389 */
3 - 11    = '02. (3, 11]   '   /* exp_sup_DAN : 171602.49 |||||||||||||        s_DANPSinC/exp_sup_DAN : 0.0013 ||||||||||||||       c_DANPSinC_descr/s_DANPSinC : 1556.62 |||||||||||||||||||  Obs :1191720 */
11 - high = '03. (11, high]'   /* exp_sup_DAN : 41501.97  |||                  s_DANPSinC/exp_sup_DAN : 0.0013 ||||||||||||||       c_DANPSinC_descr/s_DANPSinC : 1657.32 |||||||||||||||||||| Obs :318849  */
. = 'Missing'
;


VALUE VientoAgr

low - 20  = '01. (low, 20] '   /* s_DANPSinC/exp_sup_DAN : 0.0013 |||||||||||||        exp_sup_DAN : 204103.8  |||||||||||||||||||| Obs :1331505 */
20 - 22   = '02. (20, 22]  '   /* s_DANPSinC/exp_sup_DAN : 0.0017 |||||||||||||||||    exp_sup_DAN : 99301.01  ||||||||||           Obs :618743  */
22 - high = '03. (22, high]'   /* s_DANPSinC/exp_sup_DAN : 0.002  |||||||||||||||||||| exp_sup_DAN : 147065.74 ||||||||||||||       Obs :917121  */
. = '01. (low, 20]'
;


VALUE VientoPrm

low - 15  = '01. (low, 15] '   /* s_DANPSinC/exp_sup_DAN : 0.0012 ||||||||||||         exp_sup_DAN : 191022.82 |||||||||||||||||||| Obs :1256552 */
15 - 18   = '02. (15, 18]  '   /* s_DANPSinC/exp_sup_DAN : 0.002  |||||||||||||||||||| exp_sup_DAN : 127034.42 |||||||||||||        Obs :791940  */
18 - high = '03. (18, high]'   /* s_DANPSinC/exp_sup_DAN : 0.0018 |||||||||||||||||    exp_sup_DAN : 132413.32 ||||||||||||||       Obs :818877  */
. = 'Missing'
;


VALUE VientoSuav

low - 11  = '01. (low, 11] '   /* s_DANPSinC/exp_sup_DAN : 0.0012 ||||||||||||         exp_sup_DAN : 180141.23 |||||||||||||||||||| Obs :1188657 */
11 - 14   = '02. (11, 14]  '   /* s_DANPSinC/exp_sup_DAN : 0.0017 |||||||||||||||||    exp_sup_DAN : 125317.86 ||||||||||||||       Obs :782610  */
14 - high = '03. (14, high]'   /* s_DANPSinC/exp_sup_DAN : 0.002  |||||||||||||||||||| exp_sup_DAN : 145011.46 ||||||||||||||||     Obs :896102  */
. = 'Missing'
;


VALUE LluviaAgr

low - 39  = '01. (low, 39] '   /* s_DANPSinC/exp_sup_DAN : 0.0019 |||||||||||||||      exp_sup_DAN : 191091.96 |||||||||||||||||||| Obs :1259032 */
39 - 40   = '02. (39, 40]  '   /* s_DANPSinC/exp_sup_DAN : 0.0017 |||||||||||||        exp_sup_DAN : 56575.83  ||||||               Obs :386499  */
40 - 42   = '03. (40, 42]  '   /* s_DANPSinC/exp_sup_DAN : 0.0011 |||||||||            exp_sup_DAN : 112292.74 ||||||||||||         Obs :662424  */
42 - 44   = '04. (42, 44]  '   /* s_DANPSinC/exp_sup_DAN : 0.0009 |||||||              exp_sup_DAN : 49685.29  |||||                Obs :304913  */
44 - 45   = '05. (44, 45]  '   /* s_DANPSinC/exp_sup_DAN : 0.0013 ||||||||||           exp_sup_DAN : 11124.22  |                    Obs :66766   */
45 - 56   = '06. (45, 56]  '   /* s_DANPSinC/exp_sup_DAN : 0.0026 |||||||||||||||||||| exp_sup_DAN : 28890.73  |||                  Obs :183622  */
56 - 47   = '07. (56, 47]  '   /* s_DANPSinC/exp_sup_DAN : 0                           exp_sup_DAN : 0                              Obs :0       */
47 - high = '08. (47, high]'   /* s_DANPSinC/exp_sup_DAN : 0.001  ||||||||             exp_sup_DAN : 16745.22  ||                   Obs :103706  */
. = '03. (40, 42]'
;


VALUE LluviaProm

low - 26  = '01. (low, 26] '   /* s_DANPSinC/exp_sup_DAN : 0.0023 |||||||||||||        exp_sup_DAN : 109669.16 |||||||||||||||||||| Obs :709274 */
26 - 27   = '02. (26, 27]  '   /* s_DANPSinC/exp_sup_DAN : 0.0015 ||||||||             exp_sup_DAN : 86712.99  ||||||||||||||||     Obs :591553 */
27 - 29   = '03. (27, 29]  '   /* s_DANPSinC/exp_sup_DAN : 0.0012 |||||||              exp_sup_DAN : 106001.97 |||||||||||||||||||  Obs :660132 */
29 - 33   = '04. (29, 33]  '   /* s_DANPSinC/exp_sup_DAN : 0.0011 ||||||               exp_sup_DAN : 108487.79 |||||||||||||||||||| Obs :660242 */
33 - 35   = '05. (33, 35]  '   /* s_DANPSinC/exp_sup_DAN : 0.0036 |||||||||||||||||||| exp_sup_DAN : 17251.67  |||                  Obs :111596 */
35 - 37   = '06. (35, 37]  '   /* s_DANPSinC/exp_sup_DAN : 0.0013 |||||||              exp_sup_DAN : 7154.25   |                    Obs :42314  */
37 - high = '07. (37, high]'   /* s_DANPSinC/exp_sup_DAN : 0.0011 ||||||               exp_sup_DAN : 15192.72  |||                  Obs :92258  */
. = 'Missing'
;


VALUE LluviaSuav

low - 13  = '01. (low, 13] '   /* s_DANPSinC/exp_sup_DAN : 0.001  ||||||||             exp_sup_DAN : 12054.43 |||                  Obs :86842  */
13 - 14   = '02. (13, 14]  '   /* s_DANPSinC/exp_sup_DAN : 0.0025 |||||||||||||||||||| exp_sup_DAN : 84878.68 |||||||||||||||||||| Obs :546663 */
14 - 15   = '03. (14, 15]  '   /* s_DANPSinC/exp_sup_DAN : 0.0019 |||||||||||||||      exp_sup_DAN : 76080.3  ||||||||||||||||||   Obs :503315 */
15 - 16   = '04. (15, 16]  '   /* s_DANPSinC/exp_sup_DAN : 0.0011 |||||||||            exp_sup_DAN : 65149.7  |||||||||||||||      Obs :414229 */
16 - 17   = '05. (16, 17]  '   /* s_DANPSinC/exp_sup_DAN : 0.0013 ||||||||||           exp_sup_DAN : 41069.5  ||||||||||           Obs :255491 */
17 - 18   = '06. (17, 18]  '   /* s_DANPSinC/exp_sup_DAN : 0.0009 |||||||              exp_sup_DAN : 34872.39 ||||||||             Obs :215134 */
18 - 20   = '07. (18, 20]  '   /* s_DANPSinC/exp_sup_DAN : 0.0013 ||||||||||           exp_sup_DAN : 53754.1  |||||||||||||        Obs :330875 */
20 - 22   = '08. (20, 22]  '   /* s_DANPSinC/exp_sup_DAN : 0.0013 ||||||||||           exp_sup_DAN : 36396.86 |||||||||            Obs :226712 */
22 - high = '09. (22, high]'   /* s_DANPSinC/exp_sup_DAN : 0.0021 |||||||||||||||||    exp_sup_DAN : 45599.78 |||||||||||          Obs :283569 */
. = '04. (15, 16]'
;


VALUE TemperaturaAgr

low - 20  = '01. (low, 20] '   /* s_DANPSinC/exp_sup_DAN : 0.0006 ||||||               exp_sup_DAN : 36203.41  ||||                 Obs :265424  */
20 - 33   = '02. (20, 33]  '   /* s_DANPSinC/exp_sup_DAN : 0.0012 ||||||||||||         exp_sup_DAN : 174579.31 |||||||||||||||||||| Obs :1055616 */
33 - 40   = '03. (33, 40]  '   /* s_DANPSinC/exp_sup_DAN : 0.002  |||||||||||||||||||| exp_sup_DAN : 109822.03 |||||||||||||        Obs :710173  */
40 - high = '04. (40, high]'   /* s_DANPSinC/exp_sup_DAN : 0.002  |||||||||||||||||||| exp_sup_DAN : 129865.81 |||||||||||||||      Obs :836156  */
. = '02. (20, 33]'
;


VALUE TemperaturaProm

low - 27  = '01. (low, 27] '   /* s_DANPSinC/exp_sup_DAN : 0.0011 ||||||||||           exp_sup_DAN : 217720.26 |||||||||||||||||||  Obs :1361004 */
27 - high = '02. (27, high]'   /* s_DANPSinC/exp_sup_DAN : 0.0021 |||||||||||||||||||| exp_sup_DAN : 232750.3  |||||||||||||||||||| Obs :1506365 */
. = '02. (27, high]'
;


VALUE TemperaturaSuav

low - 21  = '01. (low, 21] '   /* s_DANPSinC/exp_sup_DAN : 0.0011 |||||||||||          exp_sup_DAN : 192082.63 |||||||||||||||||||| Obs :1175074 */
21 - 32   = '02. (21, 32]  '   /* s_DANPSinC/exp_sup_DAN : 0.0019 |||||||||||||||||||  exp_sup_DAN : 128849.96 |||||||||||||        Obs :857824  */
32 - high = '03. (32, high]'   /* s_DANPSinC/exp_sup_DAN : 0.002  |||||||||||||||||||| exp_sup_DAN : 129537.96 |||||||||||||        Obs :834471  */
. = '02. (21, 32]'
;


VALUE TotalPersonas

low - 800   = '01. (low, 800]  '   /* s_DANPSinC/exp_sup_DAN : 0.0017 ||||||||||||         exp_sup_DAN : 38096.72 |||||||||||          Obs :309306 */
800 - 1100  = '02. (800, 1100] '   /* s_DANPSinC/exp_sup_DAN : 0.0015 |||||||||||          exp_sup_DAN : 49638.15 ||||||||||||||       Obs :353141 */
1100 - 1200 = '03. (1100, 1200]'   /* s_DANPSinC/exp_sup_DAN : 0.0026 |||||||||||||||||||| exp_sup_DAN : 33998.05 ||||||||||           Obs :222636 */
1200 - 1300 = '04. (1200, 1300]'   /* s_DANPSinC/exp_sup_DAN : 0.0013 ||||||||||           exp_sup_DAN : 47144.93 |||||||||||||        Obs :308952 */
1300 - 1400 = '05. (1300, 1400]'   /* s_DANPSinC/exp_sup_DAN : 0.0016 ||||||||||||         exp_sup_DAN : 47653.36 ||||||||||||||       Obs :304459 */
1400 - 1500 = '06. (1400, 1500]'   /* s_DANPSinC/exp_sup_DAN : 0.0013 ||||||||||           exp_sup_DAN : 43358.45 ||||||||||||         Obs :266485 */
1500 - 1700 = '07. (1500, 1700]'   /* s_DANPSinC/exp_sup_DAN : 0.002  |||||||||||||||      exp_sup_DAN : 70073.68 |||||||||||||||||||| Obs :445207 */
1700 - 1800 = '08. (1700, 1800]'   /* s_DANPSinC/exp_sup_DAN : 0.0018 ||||||||||||||       exp_sup_DAN : 31302.28 |||||||||            Obs :191815 */
1800 - 2100 = '09. (1800, 2100]'   /* s_DANPSinC/exp_sup_DAN : 0.0014 ||||||||||           exp_sup_DAN : 54061.28 |||||||||||||||      Obs :318849 */
2100 - high = '10. (2100, high]'   /* s_DANPSinC/exp_sup_DAN : 0.0012 |||||||||            exp_sup_DAN : 53843.58 |||||||||||||||      Obs :300195 */
. = '02. (800, 1100]'
;


VALUE PorcentajeMujeres

low - 48  = '01. (low, 48] '   /* s_DANPSinC/exp_sup_DAN : 0.0018 |||||||||||||||||||  exp_sup_DAN : 47181.03  |||||||||            Obs :347220 */
48 - 49   = '02. (48, 49]  '   /* s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||||||    exp_sup_DAN : 43062.48  ||||||||             Obs :305268 */
49 - 50   = '03. (49, 50]  '   /* s_DANPSinC/exp_sup_DAN : 0.0014 |||||||||||||||      exp_sup_DAN : 81900.11  ||||||||||||||||     Obs :543426 */
50 - 51   = '04. (50, 51]  '   /* s_DANPSinC/exp_sup_DAN : 0.0018 |||||||||||||||||||  exp_sup_DAN : 103393.08 |||||||||||||||||||| Obs :670148 */
51 - 52   = '05. (51, 52]  '   /* s_DANPSinC/exp_sup_DAN : 0.0014 |||||||||||||||      exp_sup_DAN : 81402.29  ||||||||||||||||     Obs :487781 */
52 - 53   = '06. (52, 53]  '   /* s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||||||    exp_sup_DAN : 53130.34  ||||||||||           Obs :331854 */
53 - high = '07. (53, high]'   /* s_DANPSinC/exp_sup_DAN : 0.0018 |||||||||||||||||||| exp_sup_DAN : 57831     |||||||||||          Obs :323665 */
. = '04. (50, 51]'
;


VALUE PorcentajeHombres

low - 47  = '01. (low, 47] '   /* s_DANPSinC/exp_sup_DAN : 0.0018 |||||||||||||||||||| exp_sup_DAN : 57795.6   |||||||||||          Obs :323453 */
47 - 48   = '02. (47, 48]  '   /* s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||||||    exp_sup_DAN : 53702.49  ||||||||||           Obs :334678 */
48 - 49   = '03. (48, 49]  '   /* s_DANPSinC/exp_sup_DAN : 0.0014 |||||||||||||||      exp_sup_DAN : 81823.32  ||||||||||||||||     Obs :491610 */
49 - 50   = '04. (49, 50]  '   /* s_DANPSinC/exp_sup_DAN : 0.0018 |||||||||||||||||||  exp_sup_DAN : 103844.83 |||||||||||||||||||| Obs :672317 */
50 - 51   = '05. (50, 51]  '   /* s_DANPSinC/exp_sup_DAN : 0.0014 |||||||||||||||      exp_sup_DAN : 80854.82  ||||||||||||||||     Obs :538345 */
51 - 52   = '06. (51, 52]  '   /* s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||||||    exp_sup_DAN : 43076.74  ||||||||             Obs :304041 */
52 - high = '07. (52, high]'   /* s_DANPSinC/exp_sup_DAN : 0.0018 |||||||||||||||||||  exp_sup_DAN : 46770.62  |||||||||            Obs :344714 */
. = '04. (49, 50]'
;


VALUE EdadMedia

low - 41  = '01. (low, 41] '   /* s_DANPSinC/exp_sup_DAN : 0.0011 ||||||||||           exp_sup_DAN : 66158.58 |||||||||||||||||||| Obs :390205 */
41 - 42   = '02. (41, 42]  '   /* s_DANPSinC/exp_sup_DAN : 0.0017 ||||||||||||||||     exp_sup_DAN : 38276.4  ||||||||||||         Obs :236999 */
42 - 43   = '03. (42, 43]  '   /* s_DANPSinC/exp_sup_DAN : 0.0019 ||||||||||||||||||   exp_sup_DAN : 41865.11 |||||||||||||        Obs :267284 */
43 - 44   = '04. (43, 44]  '   /* s_DANPSinC/exp_sup_DAN : 0.0018 |||||||||||||||||    exp_sup_DAN : 51096.28 |||||||||||||||      Obs :329194 */
44 - 45   = '05. (44, 45]  '   /* s_DANPSinC/exp_sup_DAN : 0.0017 ||||||||||||||||     exp_sup_DAN : 53027.2  ||||||||||||||||     Obs :348089 */
45 - 46   = '06. (45, 46]  '   /* s_DANPSinC/exp_sup_DAN : 0.0011 |||||||||||          exp_sup_DAN : 46190.44 ||||||||||||||       Obs :297231 */
46 - 47   = '07. (46, 47]  '   /* s_DANPSinC/exp_sup_DAN : 0.0019 ||||||||||||||||||   exp_sup_DAN : 40292.88 ||||||||||||         Obs :251749 */
47 - 48   = '08. (47, 48]  '   /* s_DANPSinC/exp_sup_DAN : 0.002  |||||||||||||||||||  exp_sup_DAN : 30905.64 |||||||||            Obs :201786 */
48 - 51   = '09. (48, 51]  '   /* s_DANPSinC/exp_sup_DAN : 0.0021 |||||||||||||||||||| exp_sup_DAN : 57329.08 |||||||||||||||||    Obs :377269 */
51 - high = '10. (51, high]'   /* s_DANPSinC/exp_sup_DAN : 0.0011 |||||||||||          exp_sup_DAN : 42762.21 |||||||||||||        Obs :309564 */
. = 'Missing'
;


VALUE Menores16anios

low - 10  = '01. (low, 10] '   /* s_DANPSinC/exp_sup_DAN : 0.0012 ||||||||||           exp_sup_DAN : 44534.89 ||||||||||||||       Obs :340099 */
10 - 11   = '02. (10, 11]  '   /* s_DANPSinC/exp_sup_DAN : 0.0014 ||||||||||||         exp_sup_DAN : 26994.95 |||||||||            Obs :174111 */
11 - 12   = '03. (11, 12]  '   /* s_DANPSinC/exp_sup_DAN : 0.0024 |||||||||||||||||||| exp_sup_DAN : 40136.94 |||||||||||||        Obs :264254 */
12 - 13   = '04. (12, 13]  '   /* s_DANPSinC/exp_sup_DAN : 0.0016 ||||||||||||||       exp_sup_DAN : 45497.9  |||||||||||||||      Obs :295023 */
13 - 14   = '05. (13, 14]  '   /* s_DANPSinC/exp_sup_DAN : 0.0015 |||||||||||||        exp_sup_DAN : 62452.14 |||||||||||||||||||| Obs :397751 */
14 - 15   = '06. (14, 15]  '   /* s_DANPSinC/exp_sup_DAN : 0.0013 ||||||||||           exp_sup_DAN : 62374.82 |||||||||||||||||||| Obs :401052 */
15 - 16   = '07. (15, 16]  '   /* s_DANPSinC/exp_sup_DAN : 0.0019 ||||||||||||||||     exp_sup_DAN : 50722.46 ||||||||||||||||     Obs :327233 */
16 - 17   = '08. (16, 17]  '   /* s_DANPSinC/exp_sup_DAN : 0.0021 |||||||||||||||||    exp_sup_DAN : 42260.35 ||||||||||||||       Obs :261737 */
17 - 18   = '09. (17, 18]  '   /* s_DANPSinC/exp_sup_DAN : 0.0017 |||||||||||||||      exp_sup_DAN : 34932.47 |||||||||||          Obs :215337 */
18 - high = '10. (18, high]'   /* s_DANPSinC/exp_sup_DAN : 0.0012 ||||||||||           exp_sup_DAN : 57976.61 |||||||||||||||||||  Obs :332575 */
. = 'Missing'
;


VALUE Entre16y64anios

low - 58  = '01. (low, 58] '   /* s_DANPSinC/exp_sup_DAN : 0.0021 |||||||||||||||||||| exp_sup_DAN : 38673.64  |||||                Obs :258615  */
58 - 64   = '02. (58, 64]  '   /* s_DANPSinC/exp_sup_DAN : 0.0016 ||||||||||||||||     exp_sup_DAN : 162304.65 |||||||||||||||||||  Obs :1037472 */
64 - 67   = '03. (64, 67]  '   /* s_DANPSinC/exp_sup_DAN : 0.0017 ||||||||||||||||     exp_sup_DAN : 166993.84 |||||||||||||||||||| Obs :1084474 */
67 - high = '04. (67, high]'   /* s_DANPSinC/exp_sup_DAN : 0.0012 |||||||||||          exp_sup_DAN : 99931.7   ||||||||||||         Obs :628809  */
. = 'Missing'
;


VALUE Mayores64anios

low - 14  = '01. (low, 14] '   /* s_DANPSinC/exp_sup_DAN : 0.0013 |||||||||||||        exp_sup_DAN : 48456.84 ||||||||||||||       Obs :279216 */
14 - 17   = '02. (14, 17]  '   /* s_DANPSinC/exp_sup_DAN : 0.0013 |||||||||||||        exp_sup_DAN : 64000.51 |||||||||||||||||||  Obs :407071 */
17 - 18   = '03. (17, 18]  '   /* s_DANPSinC/exp_sup_DAN : 0.0019 |||||||||||||||||||  exp_sup_DAN : 30164.43 |||||||||            Obs :185272 */
18 - 20   = '04. (18, 20]  '   /* s_DANPSinC/exp_sup_DAN : 0.0018 ||||||||||||||||||   exp_sup_DAN : 68773.02 |||||||||||||||||||| Obs :445879 */
20 - 21   = '05. (20, 21]  '   /* s_DANPSinC/exp_sup_DAN : 0.0012 ||||||||||||         exp_sup_DAN : 30937.58 |||||||||            Obs :205228 */
21 - 23   = '06. (21, 23]  '   /* s_DANPSinC/exp_sup_DAN : 0.0015 |||||||||||||||      exp_sup_DAN : 56455.7  ||||||||||||||||     Obs :363437 */
23 - 24   = '07. (23, 24]  '   /* s_DANPSinC/exp_sup_DAN : 0.002  |||||||||||||||||||| exp_sup_DAN : 22941.99 |||||||              Obs :149220 */
24 - 27   = '08. (24, 27]  '   /* s_DANPSinC/exp_sup_DAN : 0.0018 ||||||||||||||||||   exp_sup_DAN : 54451.25 ||||||||||||||||     Obs :352135 */
27 - 31   = '09. (27, 31]  '   /* s_DANPSinC/exp_sup_DAN : 0.0015 |||||||||||||||      exp_sup_DAN : 47054.26 ||||||||||||||       Obs :312005 */
31 - high = '10. (31, high]'   /* s_DANPSinC/exp_sup_DAN : 0.002  |||||||||||||||||||| exp_sup_DAN : 44668.24 |||||||||||||        Obs :309907 */
. = 'Missing'
;


VALUE PorcentajeExtranjeros

low - 2  = '01. (low, 2] '   /* s_DANPSinC/exp_sup_DAN : 0.0008 ||||||||             exp_sup_DAN : 35564.05  |||                  Obs :284702  */
2 - 3    = '02. (2, 3]   '   /* s_DANPSinC/exp_sup_DAN : 0.0009 |||||||||            exp_sup_DAN : 36913.32  |||                  Obs :260914  */
3 - 6    = '03. (3, 6]   '   /* s_DANPSinC/exp_sup_DAN : 0.0012 ||||||||||||         exp_sup_DAN : 100453.85 ||||||||             Obs :646255  */
6 - 8    = '04. (6, 8]   '   /* s_DANPSinC/exp_sup_DAN : 0.0016 ||||||||||||||||     exp_sup_DAN : 53102.89  ||||                 Obs :335275  */
8 - high = '05. (8, high]'   /* s_DANPSinC/exp_sup_DAN : 0.002  |||||||||||||||||||| exp_sup_DAN : 241869.71 |||||||||||||||||||| Obs :1482224 */
. = '04. (6, 8]'
;


VALUE NacidasExtranjero

low - 5    = '01. (low, 5]   '   /* s_DANPSinC/exp_sup_DAN : 0.0009 ||||||||||           exp_sup_DAN : 69099.21  |||                  Obs :547259  */
5 - 916    = '02. (5, 916]   '   /* s_DANPSinC/exp_sup_DAN : 0.0017 |||||||||||||||||||| exp_sup_DAN : 398804.61 |||||||||||||||||||| Obs :2462111 */
916 - high = '03. (916, high]'   /* s_DANPSinC/exp_sup_DAN : 0                           exp_sup_DAN : 0                              Obs :0       */
. = '03. (916, high]'
;


VALUE EstudiosSuperioresCur

low - 3  = '01. (low, 3] '   /* s_DANPSinC/exp_sup_DAN : 0.0012 ||||||||||||||       exp_sup_DAN : 43572.5   ||||                 Obs :301257  */
3 - 4    = '02. (3, 4]   '   /* s_DANPSinC/exp_sup_DAN : 0.0015 |||||||||||||||||    exp_sup_DAN : 83018.04  ||||||||             Obs :564306  */
4 - 5    = '03. (4, 5]   '   /* s_DANPSinC/exp_sup_DAN : 0.0017 |||||||||||||||||||| exp_sup_DAN : 138696.78 ||||||||||||||       Obs :908833  */
5 - high = '04. (5, high]'   /* s_DANPSinC/exp_sup_DAN : 0.0017 |||||||||||||||||||  exp_sup_DAN : 202616.51 |||||||||||||||||||| Obs :1234974 */
. = '02. (3, 4]'
;


VALUE EstudiosUniversitariosCur

low - 3  = '01. (low, 3] '   /* s_DANPSinC/exp_sup_DAN : 0.0014 |||||||||||||||||    exp_sup_DAN : 154335.62 |||||||||||||        Obs :1047187 */
3 - 5    = '02. (3, 5]   '   /* s_DANPSinC/exp_sup_DAN : 0.0017 |||||||||||||||||||| exp_sup_DAN : 239869.07 |||||||||||||||||||| Obs :1552503 */
5 - high = '03. (5, high]'   /* s_DANPSinC/exp_sup_DAN : 0.0017 |||||||||||||||||||| exp_sup_DAN : 73699.13  ||||||               Obs :409680  */
. = '03. (5, high]'
;


VALUE EstudiosSuperioresReal

low - 15  = '01. (low, 15] '   /* s_DANPSinC/exp_sup_DAN : 0.0015 |||||||||||||        exp_sup_DAN : 34654.66 ||||||||||||         Obs :252267 */
15 - 18   = '02. (15, 18]  '   /* s_DANPSinC/exp_sup_DAN : 0.0015 |||||||||||||        exp_sup_DAN : 39126.67 ||||||||||||||       Obs :296544 */
18 - 21   = '03. (18, 21]  '   /* s_DANPSinC/exp_sup_DAN : 0.0012 ||||||||||           exp_sup_DAN : 46198.71 ||||||||||||||||     Obs :338131 */
21 - 24   = '04. (21, 24]  '   /* s_DANPSinC/exp_sup_DAN : 0.0018 ||||||||||||||||     exp_sup_DAN : 51853.3  ||||||||||||||||||   Obs :353810 */
24 - 26   = '05. (24, 26]  '   /* s_DANPSinC/exp_sup_DAN : 0.002  ||||||||||||||||||   exp_sup_DAN : 35838.58 |||||||||||||        Obs :244963 */
26 - 29   = '06. (26, 29]  '   /* s_DANPSinC/exp_sup_DAN : 0.0017 |||||||||||||||      exp_sup_DAN : 56050.32 |||||||||||||||||||| Obs :354873 */
29 - 32   = '07. (29, 32]  '   /* s_DANPSinC/exp_sup_DAN : 0.0011 ||||||||||           exp_sup_DAN : 49409.35 |||||||||||||||||    Obs :298652 */
32 - 36   = '08. (32, 36]  '   /* s_DANPSinC/exp_sup_DAN : 0.0014 ||||||||||||         exp_sup_DAN : 44009.33 ||||||||||||||||     Obs :261380 */
36 - 44   = '09. (36, 44]  '   /* s_DANPSinC/exp_sup_DAN : 0.0016 ||||||||||||||       exp_sup_DAN : 56765.32 |||||||||||||||||||| Obs :330098 */
44 - high = '10. (44, high]'   /* s_DANPSinC/exp_sup_DAN : 0.0022 |||||||||||||||||||| exp_sup_DAN : 53994.7  |||||||||||||||||||  Obs :278482 */
. = '03. (18, 21]'
;


VALUE ParadosEntreActivos

low - 12  = '01. (low, 12] '   /* s_DANPSinC/exp_sup_DAN : 0.0022 |||||||||||||||||||| exp_sup_DAN : 92908.55  ||||||||||||||       Obs :542324 */
12 - 15   = '02. (12, 15]  '   /* s_DANPSinC/exp_sup_DAN : 0.0018 ||||||||||||||||     exp_sup_DAN : 94873.6   |||||||||||||||      Obs :572861 */
15 - 19   = '03. (15, 19]  '   /* s_DANPSinC/exp_sup_DAN : 0.0016 ||||||||||||||       exp_sup_DAN : 128168.42 |||||||||||||||||||| Obs :783345 */
19 - 21   = '04. (19, 21]  '   /* s_DANPSinC/exp_sup_DAN : 0.0014 |||||||||||||        exp_sup_DAN : 38717.21  ||||||               Obs :252994 */
21 - 23   = '05. (21, 23]  '   /* s_DANPSinC/exp_sup_DAN : 0.0014 ||||||||||||         exp_sup_DAN : 31780.46  |||||                Obs :222095 */
23 - high = '06. (23, high]'   /* s_DANPSinC/exp_sup_DAN : 0.0009 ||||||||             exp_sup_DAN : 81455.59  |||||||||||||        Obs :635751 */
. = '03. (15, 19]'
;


VALUE OcupadosEntrePoblacion

low - 37  = '01. (low, 37] '   /* s_DANPSinC/exp_sup_DAN : 0.0009 ||||||||             exp_sup_DAN : 45052.73 ||||||||||||||       Obs :303727 */
37 - 40   = '02. (37, 40]  '   /* s_DANPSinC/exp_sup_DAN : 0.0012 ||||||||||           exp_sup_DAN : 44302.99 ||||||||||||||       Obs :318388 */
40 - 42   = '03. (40, 42]  '   /* s_DANPSinC/exp_sup_DAN : 0.0015 |||||||||||||        exp_sup_DAN : 45165.81 ||||||||||||||       Obs :318634 */
42 - 43   = '04. (42, 43]  '   /* s_DANPSinC/exp_sup_DAN : 0.0011 |||||||||            exp_sup_DAN : 27150.49 |||||||||            Obs :183583 */
43 - 45   = '05. (43, 45]  '   /* s_DANPSinC/exp_sup_DAN : 0.0023 |||||||||||||||||||| exp_sup_DAN : 56784.67 ||||||||||||||||||   Obs :376954 */
45 - 46   = '06. (45, 46]  '   /* s_DANPSinC/exp_sup_DAN : 0.0012 ||||||||||           exp_sup_DAN : 35811.71 |||||||||||          Obs :224699 */
46 - 48   = '07. (46, 48]  '   /* s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||        exp_sup_DAN : 63417.42 |||||||||||||||||||| Obs :399001 */
48 - 50   = '08. (48, 50]  '   /* s_DANPSinC/exp_sup_DAN : 0.0022 |||||||||||||||||||  exp_sup_DAN : 50552.21 ||||||||||||||||     Obs :309851 */
50 - 53   = '09. (50, 53]  '   /* s_DANPSinC/exp_sup_DAN : 0.0022 |||||||||||||||||||  exp_sup_DAN : 48973.07 |||||||||||||||      Obs :291941 */
53 - high = '10. (53, high]'   /* s_DANPSinC/exp_sup_DAN : 0.0013 |||||||||||          exp_sup_DAN : 50692.73 ||||||||||||||||     Obs :282576 */
. = '03. (40, 42]'
;


VALUE ActivosEntrePoblacion

low - 47  = '01. (low, 47] '   /* s_DANPSinC/exp_sup_DAN : 0.0013 ||||||||||||         exp_sup_DAN : 47200.09 ||||||||||||||||     Obs :294155 */
47 - 50   = '02. (47, 50]  '   /* s_DANPSinC/exp_sup_DAN : 0.0019 ||||||||||||||||||   exp_sup_DAN : 45704.92 |||||||||||||||      Obs :304850 */
50 - 52   = '03. (50, 52]  '   /* s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||||      exp_sup_DAN : 49665.83 |||||||||||||||||    Obs :323562 */
52 - 54   = '04. (52, 54]  '   /* s_DANPSinC/exp_sup_DAN : 0.0014 ||||||||||||||       exp_sup_DAN : 54646.89 ||||||||||||||||||   Obs :360257 */
54 - 55   = '05. (54, 55]  '   /* s_DANPSinC/exp_sup_DAN : 0.0019 ||||||||||||||||||   exp_sup_DAN : 36319.3  ||||||||||||         Obs :238217 */
55 - 56   = '06. (55, 56]  '   /* s_DANPSinC/exp_sup_DAN : 0.0015 |||||||||||||||      exp_sup_DAN : 39387.33 |||||||||||||        Obs :262843 */
56 - 57   = '07. (56, 57]  '   /* s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||||      exp_sup_DAN : 37731.67 |||||||||||||        Obs :254576 */
57 - 59   = '08. (57, 59]  '   /* s_DANPSinC/exp_sup_DAN : 0.0021 |||||||||||||||||||| exp_sup_DAN : 59479.9  |||||||||||||||||||| Obs :374689 */
59 - 61   = '09. (59, 61]  '   /* s_DANPSinC/exp_sup_DAN : 0.0014 ||||||||||||||       exp_sup_DAN : 37320.07 ||||||||||||         Obs :239018 */
61 - high = '10. (61, high]'   /* s_DANPSinC/exp_sup_DAN : 0.0013 |||||||||||||        exp_sup_DAN : 60009.27 |||||||||||||||||||| Obs :355575 */
. = 'Missing'
;


VALUE PensionistasInvEntrePoblacion

low - 1  = '01. (low, 1] '   /* s_DANPSinC/exp_sup_DAN : 0.002  |||||||||||||||||||| exp_sup_DAN : 14111.02  ||                   Obs :67866   */
1 - 2    = '02. (1, 2]   '   /* s_DANPSinC/exp_sup_DAN : 0.0019 |||||||||||||||||||  exp_sup_DAN : 134608.72 |||||||||||||||||    Obs :766171  */
2 - 3    = '03. (2, 3]   '   /* s_DANPSinC/exp_sup_DAN : 0.0016 ||||||||||||||||     exp_sup_DAN : 161572.05 |||||||||||||||||||| Obs :1039418 */
3 - 4    = '04. (3, 4]   '   /* s_DANPSinC/exp_sup_DAN : 0.0014 ||||||||||||||       exp_sup_DAN : 107199.7  |||||||||||||        Obs :749526  */
4 - high = '05. (4, high]'   /* s_DANPSinC/exp_sup_DAN : 0.001  ||||||||||           exp_sup_DAN : 50082.24  ||||||               Obs :383596  */
. = '03. (2, 3]'
;


VALUE PensionistasJubEntrePoblacion

low - 14  = '01. (low, 14] '   /* s_DANPSinC/exp_sup_DAN : 0.0012 |||||||||||||        exp_sup_DAN : 96500.08  ||||||               Obs :608691  */
14 - 16   = '02. (14, 16]  '   /* s_DANPSinC/exp_sup_DAN : 0.0015 |||||||||||||||||    exp_sup_DAN : 73971.27  |||||                Obs :480399  */
16 - high = '03. (16, high]'   /* s_DANPSinC/exp_sup_DAN : 0.0018 |||||||||||||||||||| exp_sup_DAN : 297432.47 |||||||||||||||||||| Obs :1920280 */
. = 'Missing'
;


VALUE OtraInactividadEntrePoblacion

low - 14  = '01. (low, 14] '   /* s_DANPSinC/exp_sup_DAN : 0.0013 ||||||||||||         exp_sup_DAN : 56293.8  |||||||||||||||||||| Obs :340528 */
14 - 15   = '02. (14, 15]  '   /* s_DANPSinC/exp_sup_DAN : 0.0015 ||||||||||||||       exp_sup_DAN : 34180.5  ||||||||||||         Obs :211437 */
15 - 16   = '03. (15, 16]  '   /* s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||||      exp_sup_DAN : 45801.29 ||||||||||||||||     Obs :287579 */
16 - 17   = '04. (16, 17]  '   /* s_DANPSinC/exp_sup_DAN : 0.0017 ||||||||||||||||     exp_sup_DAN : 45449.3  ||||||||||||||||     Obs :290976 */
17 - 18   = '05. (17, 18]  '   /* s_DANPSinC/exp_sup_DAN : 0.0021 |||||||||||||||||||| exp_sup_DAN : 55430.14 |||||||||||||||||||| Obs :355572 */
18 - 19   = '06. (18, 19]  '   /* s_DANPSinC/exp_sup_DAN : 0.0018 |||||||||||||||||    exp_sup_DAN : 50910.83 ||||||||||||||||||   Obs :340568 */
19 - 20   = '07. (19, 20]  '   /* s_DANPSinC/exp_sup_DAN : 0.0017 ||||||||||||||||     exp_sup_DAN : 42633.56 |||||||||||||||      Obs :289517 */
20 - 21   = '08. (20, 21]  '   /* s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||||      exp_sup_DAN : 33309.09 ||||||||||||         Obs :233965 */
21 - 24   = '09. (21, 24]  '   /* s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||||      exp_sup_DAN : 52893.16 |||||||||||||||||||  Obs :361806 */
24 - high = '10. (24, high]'   /* s_DANPSinC/exp_sup_DAN : 0.001  |||||||||            exp_sup_DAN : 51002.16 ||||||||||||||||||   Obs :297419 */
. = '02. (14, 15]'
;


VALUE EstudiantesEntrePoblacion

low - 5  = '01. (low, 5] '   /* s_DANPSinC/exp_sup_DAN : 0.0012 ||||||||||||         exp_sup_DAN : 48385.8   ||||||||             Obs :333963 */
5 - 6    = '02. (5, 6]   '   /* s_DANPSinC/exp_sup_DAN : 0.0014 |||||||||||||||      exp_sup_DAN : 67204.3   ||||||||||||         Obs :431102 */
6 - 7    = '03. (6, 7]   '   /* s_DANPSinC/exp_sup_DAN : 0.0019 |||||||||||||||||||| exp_sup_DAN : 114761.27 |||||||||||||||||||| Obs :740828 */
7 - 8    = '04. (7, 8]   '   /* s_DANPSinC/exp_sup_DAN : 0.0018 |||||||||||||||||||  exp_sup_DAN : 110119.45 |||||||||||||||||||  Obs :719694 */
8 - 9    = '05. (8, 9]   '   /* s_DANPSinC/exp_sup_DAN : 0.0015 |||||||||||||||      exp_sup_DAN : 72732.83  |||||||||||||        Obs :473286 */
9 - high = '06. (9, high]'   /* s_DANPSinC/exp_sup_DAN : 0.0013 ||||||||||||||       exp_sup_DAN : 54532.39  ||||||||||           Obs :309249 */
. = '03. (6, 7]'
;


VALUE PorcentajeSolteros

low - 37  = '01. (low, 37] '   /* s_DANPSinC/exp_sup_DAN : 0.0011 |||||||||            exp_sup_DAN : 52280.05 ||||||||||||||||     Obs :345093 */
37 - 39   = '02. (37, 39]  '   /* s_DANPSinC/exp_sup_DAN : 0.0024 |||||||||||||||||||| exp_sup_DAN : 41361.84 |||||||||||||        Obs :277618 */
39 - 40   = '03. (39, 40]  '   /* s_DANPSinC/exp_sup_DAN : 0.0022 ||||||||||||||||||   exp_sup_DAN : 38393.94 ||||||||||||         Obs :258746 */
40 - 41   = '04. (40, 41]  '   /* s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||        exp_sup_DAN : 47972.97 |||||||||||||||      Obs :312592 */
41 - 42   = '05. (41, 42]  '   /* s_DANPSinC/exp_sup_DAN : 0.0017 ||||||||||||||       exp_sup_DAN : 55141.78 |||||||||||||||||    Obs :365143 */
42 - 43   = '06. (42, 43]  '   /* s_DANPSinC/exp_sup_DAN : 0.0019 ||||||||||||||||     exp_sup_DAN : 50486.04 ||||||||||||||||     Obs :330728 */
43 - 44   = '07. (43, 44]  '   /* s_DANPSinC/exp_sup_DAN : 0.0015 |||||||||||||        exp_sup_DAN : 50289.87 ||||||||||||||||     Obs :308058 */
44 - 45   = '08. (44, 45]  '   /* s_DANPSinC/exp_sup_DAN : 0.0012 ||||||||||           exp_sup_DAN : 35322.95 |||||||||||          Obs :219616 */
45 - 46   = '09. (45, 46]  '   /* s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||        exp_sup_DAN : 32395.9  ||||||||||           Obs :202504 */
46 - high = '10. (46, high]'   /* s_DANPSinC/exp_sup_DAN : 0.001  ||||||||             exp_sup_DAN : 64081.99 |||||||||||||||||||| Obs :388549 */
. = 'Missing'
;


VALUE PorcentajeCasados

low - 36  = '01. (low, 36] '   /* s_DANPSinC/exp_sup_DAN : 0.0007 ||||||               exp_sup_DAN : 47889.04 |||||||||||||        Obs :311835 */
36 - 38   = '02. (36, 38]  '   /* s_DANPSinC/exp_sup_DAN : 0.0013 |||||||||||          exp_sup_DAN : 40255.26 |||||||||||          Obs :242798 */
38 - 40   = '03. (38, 40]  '   /* s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||        exp_sup_DAN : 74107.71 |||||||||||||||||||| Obs :447104 */
40 - 41   = '04. (40, 41]  '   /* s_DANPSinC/exp_sup_DAN : 0.0013 |||||||||||          exp_sup_DAN : 51994.14 ||||||||||||||       Obs :319231 */
41 - 42   = '05. (41, 42]  '   /* s_DANPSinC/exp_sup_DAN : 0.0019 ||||||||||||||||     exp_sup_DAN : 48721.7  |||||||||||||        Obs :305435 */
42 - 43   = '06. (42, 43]  '   /* s_DANPSinC/exp_sup_DAN : 0.0022 |||||||||||||||||||  exp_sup_DAN : 51924.19 ||||||||||||||       Obs :332300 */
43 - 44   = '07. (43, 44]  '   /* s_DANPSinC/exp_sup_DAN : 0.0012 ||||||||||           exp_sup_DAN : 38737.29 ||||||||||           Obs :258065 */
44 - 45   = '08. (44, 45]  '   /* s_DANPSinC/exp_sup_DAN : 0.0024 |||||||||||||||||||| exp_sup_DAN : 30748.14 ||||||||             Obs :208510 */
45 - 47   = '09. (45, 47]  '   /* s_DANPSinC/exp_sup_DAN : 0.0017 ||||||||||||||       exp_sup_DAN : 50155.73 ||||||||||||||       Obs :346155 */
47 - high = '10. (47, high]'   /* s_DANPSinC/exp_sup_DAN : 0.0017 ||||||||||||||       exp_sup_DAN : 33350.76 |||||||||            Obs :237818 */
. = 'Missing'
;


VALUE PorcentajeViudos

low - 4   = '01. (low, 4]  '   /* s_DANPSinC/exp_sup_DAN : 0.0014 |||||||||||          exp_sup_DAN : 43894.51 |||||||||            Obs :249708 */
4 - 5     = '02. (4, 5]    '   /* s_DANPSinC/exp_sup_DAN : 0.0013 |||||||||||          exp_sup_DAN : 52504.5  |||||||||||          Obs :313778 */
5 - 6     = '03. (5, 6]    '   /* s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||        exp_sup_DAN : 88727.11 ||||||||||||||||||   Obs :533463 */
6 - 7     = '04. (6, 7]    '   /* s_DANPSinC/exp_sup_DAN : 0.0019 ||||||||||||||||     exp_sup_DAN : 96931.64 |||||||||||||||||||| Obs :636953 */
7 - 8     = '05. (7, 8]    '   /* s_DANPSinC/exp_sup_DAN : 0.0015 |||||||||||||        exp_sup_DAN : 69480.34 ||||||||||||||       Obs :457926 */
8 - 9     = '06. (8, 9]    '   /* s_DANPSinC/exp_sup_DAN : 0.0017 ||||||||||||||       exp_sup_DAN : 51294.76 |||||||||||          Obs :341979 */
9 - 10    = '07. (9, 10]   '   /* s_DANPSinC/exp_sup_DAN : 0.0024 |||||||||||||||||||| exp_sup_DAN : 27547.82 ||||||               Obs :195533 */
10 - high = '08. (10, high]'   /* s_DANPSinC/exp_sup_DAN : 0.001  ||||||||             exp_sup_DAN : 37501.68 ||||||||             Obs :279936 */
. = 'Missing'
;


VALUE SinInfoEstadoCivil

low - 2  = '01. (low, 2] '   /* s_DANPSinC/exp_sup_DAN : 0.0018 |||||||||||||||||||  exp_sup_DAN : 47008.25  |||||||              Obs :320861 */
2 - 3    = '02. (2, 3]   '   /* s_DANPSinC/exp_sup_DAN : 0.0014 ||||||||||||||       exp_sup_DAN : 102287.73 ||||||||||||||||     Obs :688248 */
3 - 4    = '03. (3, 4]   '   /* s_DANPSinC/exp_sup_DAN : 0.0019 |||||||||||||||||||| exp_sup_DAN : 130284.37 |||||||||||||||||||| Obs :822498 */
4 - 5    = '04. (4, 5]   '   /* s_DANPSinC/exp_sup_DAN : 0.0018 |||||||||||||||||||  exp_sup_DAN : 79941.58  ||||||||||||         Obs :512876 */
5 - 6    = '05. (5, 6]   '   /* s_DANPSinC/exp_sup_DAN : 0.0013 ||||||||||||||       exp_sup_DAN : 43357.02  |||||||              Obs :273725 */
6 - high = '06. (6, high]'   /* s_DANPSinC/exp_sup_DAN : 0.0012 |||||||||||||        exp_sup_DAN : 64819.35  ||||||||||           Obs :389125 */
. = 'Missing'
;


VALUE PorcentajeDivorciados

low - 4  = '01. (low, 4] '   /* s_DANPSinC/exp_sup_DAN : 0.0018 |||||||||||||||||||  exp_sup_DAN : 44816.36  |||||||              Obs :357460 */
4 - 5    = '02. (4, 5]   '   /* s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||||||    exp_sup_DAN : 59421.25  |||||||||            Obs :425850 */
5 - 6    = '03. (5, 6]   '   /* s_DANPSinC/exp_sup_DAN : 0.0017 ||||||||||||||||||   exp_sup_DAN : 102306.51 |||||||||||||||      Obs :649832 */
6 - 7    = '04. (6, 7]   '   /* s_DANPSinC/exp_sup_DAN : 0.0019 |||||||||||||||||||| exp_sup_DAN : 136178.41 |||||||||||||||||||| Obs :820118 */
7 - 8    = '05. (7, 8]   '   /* s_DANPSinC/exp_sup_DAN : 0.0012 |||||||||||||        exp_sup_DAN : 82216.67  ||||||||||||         Obs :488326 */
8 - high = '06. (8, high]'   /* s_DANPSinC/exp_sup_DAN : 0.001  |||||||||||          exp_sup_DAN : 42905.78  ||||||               Obs :267143 */
. = 'Missing'
;


VALUE TotalViviendas

low - 500   = '01. (low, 500]  '   /* s_DANPSinC/exp_sup_DAN : 0.0017 |||||||||||||||||    exp_sup_DAN : 27271.94 ||||||               Obs :200926 */
500 - 600   = '02. (500, 600]  '   /* s_DANPSinC/exp_sup_DAN : 0.0014 ||||||||||||||       exp_sup_DAN : 46975.03 ||||||||||           Obs :303861 */
600 - 700   = '03. (600, 700]  '   /* s_DANPSinC/exp_sup_DAN : 0.002  |||||||||||||||||||| exp_sup_DAN : 94313.03 |||||||||||||||||||| Obs :601782 */
700 - 800   = '04. (700, 800]  '   /* s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||||||    exp_sup_DAN : 85151.22 ||||||||||||||||||   Obs :551656 */
800 - 900   = '05. (800, 900]  '   /* s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||||||    exp_sup_DAN : 59736.61 |||||||||||||        Obs :389790 */
900 - 1100  = '06. (900, 1100] '   /* s_DANPSinC/exp_sup_DAN : 0.0015 |||||||||||||||      exp_sup_DAN : 63644.7  |||||||||||||        Obs :411559 */
1100 - 1400 = '07. (1100, 1400]'   /* s_DANPSinC/exp_sup_DAN : 0.0012 ||||||||||||         exp_sup_DAN : 42685.37 |||||||||            Obs :274849 */
1400 - high = '08. (1400, high]'   /* s_DANPSinC/exp_sup_DAN : 0.0014 ||||||||||||||       exp_sup_DAN : 48125.93 ||||||||||           Obs :274947 */
. = '03. (600, 700]'
;


VALUE ViviendasPrincipales

low - 340  = '01. (low, 340] '   /* s_DANPSinC/exp_sup_DAN : 0.0017 ||||||||||||||       exp_sup_DAN : 37410.27 ||||||||||||||       Obs :298696 */
340 - 440  = '02. (340, 440] '   /* s_DANPSinC/exp_sup_DAN : 0.0013 ||||||||||           exp_sup_DAN : 42985.24 ||||||||||||||||     Obs :309734 */
440 - 490  = '03. (440, 490] '   /* s_DANPSinC/exp_sup_DAN : 0.0018 ||||||||||||||       exp_sup_DAN : 47089.82 |||||||||||||||||    Obs :318017 */
490 - 520  = '04. (490, 520] '   /* s_DANPSinC/exp_sup_DAN : 0.0014 |||||||||||          exp_sup_DAN : 38198.26 ||||||||||||||       Obs :252684 */
520 - 560  = '05. (520, 560] '   /* s_DANPSinC/exp_sup_DAN : 0.0025 |||||||||||||||||||| exp_sup_DAN : 52388.3  |||||||||||||||||||  Obs :327149 */
560 - 590  = '06. (560, 590] '   /* s_DANPSinC/exp_sup_DAN : 0.0011 |||||||||            exp_sup_DAN : 41990.69 |||||||||||||||      Obs :269247 */
590 - 630  = '07. (590, 630] '   /* s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||        exp_sup_DAN : 54629.38 |||||||||||||||||||| Obs :329175 */
630 - 700  = '08. (630, 700] '   /* s_DANPSinC/exp_sup_DAN : 0.0019 |||||||||||||||      exp_sup_DAN : 51463.89 |||||||||||||||||||  Obs :315669 */
700 - 800  = '09. (700, 800] '   /* s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||        exp_sup_DAN : 47170.41 |||||||||||||||||    Obs :281741 */
800 - high = '10. (800, high]'   /* s_DANPSinC/exp_sup_DAN : 0.0011 |||||||||            exp_sup_DAN : 54551.25 |||||||||||||||||||| Obs :307045 */
. = '03. (440, 490]'
;


VALUE viviendasNoPrincipales

low - 90   = '01. (low, 90]  '   /* s_DANPSinC/exp_sup_DAN : 0.002  |||||||||||||||||||  exp_sup_DAN : 56082.08 |||||||||||||||||||| Obs :329006 */
90 - 120   = '02. (90, 120]  '   /* s_DANPSinC/exp_sup_DAN : 0.0015 ||||||||||||||       exp_sup_DAN : 53120    |||||||||||||||||||  Obs :323765 */
120 - 150  = '03. (120, 150] '   /* s_DANPSinC/exp_sup_DAN : 0.002  |||||||||||||||||||  exp_sup_DAN : 46147.24 ||||||||||||||||     Obs :283796 */
150 - 180  = '04. (150, 180] '   /* s_DANPSinC/exp_sup_DAN : 0.0011 |||||||||||          exp_sup_DAN : 39138.96 ||||||||||||||       Obs :251565 */
180 - 220  = '05. (180, 220] '   /* s_DANPSinC/exp_sup_DAN : 0.0017 ||||||||||||||||     exp_sup_DAN : 50435.82 ||||||||||||||||||   Obs :328169 */
220 - 270  = '06. (220, 270] '   /* s_DANPSinC/exp_sup_DAN : 0.0013 |||||||||||||        exp_sup_DAN : 46126.45 ||||||||||||||||     Obs :312455 */
270 - 330  = '07. (270, 330] '   /* s_DANPSinC/exp_sup_DAN : 0.0021 |||||||||||||||||||| exp_sup_DAN : 41330.94 |||||||||||||||      Obs :281195 */
330 - 440  = '08. (330, 440] '   /* s_DANPSinC/exp_sup_DAN : 0.0015 |||||||||||||||      exp_sup_DAN : 41240.39 |||||||||||||||      Obs :295544 */
440 - 660  = '09. (440, 660] '   /* s_DANPSinC/exp_sup_DAN : 0.0015 ||||||||||||||       exp_sup_DAN : 42292.23 |||||||||||||||      Obs :298650 */
660 - high = '10. (660, high]'   /* s_DANPSinC/exp_sup_DAN : 0.0013 |||||||||||||        exp_sup_DAN : 51989.72 |||||||||||||||||||  Obs :305225 */
. = 'Missing'
;


VALUE ViviendasPropiedad

low - 260  = '01. (low, 260] '   /* s_DANPSinC/exp_sup_DAN : 0.0016 ||||||||||||||       exp_sup_DAN : 38292.09 ||||||||||||||       Obs :306483 */
260 - 330  = '02. (260, 330] '   /* s_DANPSinC/exp_sup_DAN : 0.0014 ||||||||||||         exp_sup_DAN : 41371.92 |||||||||||||||      Obs :289863 */
330 - 370  = '03. (330, 370] '   /* s_DANPSinC/exp_sup_DAN : 0.0013 |||||||||||          exp_sup_DAN : 44580.42 ||||||||||||||||     Obs :299306 */
370 - 400  = '04. (370, 400] '   /* s_DANPSinC/exp_sup_DAN : 0.0023 |||||||||||||||||||| exp_sup_DAN : 47506.87 |||||||||||||||||    Obs :304292 */
400 - 430  = '05. (400, 430] '   /* s_DANPSinC/exp_sup_DAN : 0.0014 ||||||||||||         exp_sup_DAN : 47786.36 ||||||||||||||||||   Obs :300375 */
430 - 460  = '06. (430, 460] '   /* s_DANPSinC/exp_sup_DAN : 0.0015 |||||||||||||        exp_sup_DAN : 51032.86 |||||||||||||||||||  Obs :324981 */
460 - 490  = '07. (460, 490] '   /* s_DANPSinC/exp_sup_DAN : 0.002  ||||||||||||||||||   exp_sup_DAN : 47378.54 |||||||||||||||||    Obs :300575 */
490 - 530  = '08. (490, 530] '   /* s_DANPSinC/exp_sup_DAN : 0.0017 |||||||||||||||      exp_sup_DAN : 42616.51 ||||||||||||||||     Obs :261322 */
530 - 610  = '09. (530, 610] '   /* s_DANPSinC/exp_sup_DAN : 0.0017 |||||||||||||||      exp_sup_DAN : 52844.02 |||||||||||||||||||  Obs :316331 */
610 - high = '10. (610, high]'   /* s_DANPSinC/exp_sup_DAN : 0.0012 ||||||||||           exp_sup_DAN : 54494.23 |||||||||||||||||||| Obs :305842 */
. = 'Missing'
;


VALUE ViviendasAlquiler

low - 20   = '01. (low, 20]  '   /* s_DANPSinC/exp_sup_DAN : 0.0018 |||||||||||||||||    exp_sup_DAN : 27939.05 ||||||||             Obs :231156 */
20 - 40    = '02. (20, 40]   '   /* s_DANPSinC/exp_sup_DAN : 0.0013 ||||||||||||         exp_sup_DAN : 63339.13 ||||||||||||||||||   Obs :467557 */
40 - 50    = '03. (40, 50]   '   /* s_DANPSinC/exp_sup_DAN : 0.0015 ||||||||||||||       exp_sup_DAN : 37400.47 ||||||||||           Obs :258838 */
50 - 60    = '04. (50, 60]   '   /* s_DANPSinC/exp_sup_DAN : 0.0013 |||||||||||||        exp_sup_DAN : 40707.58 |||||||||||          Obs :263640 */
60 - 70    = '05. (60, 70]   '   /* s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||||      exp_sup_DAN : 41013.22 |||||||||||          Obs :270402 */
70 - 80    = '06. (70, 80]   '   /* s_DANPSinC/exp_sup_DAN : 0.0017 ||||||||||||||||     exp_sup_DAN : 42513.37 ||||||||||||         Obs :267603 */
80 - 100   = '07. (80, 100]  '   /* s_DANPSinC/exp_sup_DAN : 0.0021 |||||||||||||||||||| exp_sup_DAN : 71397.48 |||||||||||||||||||| Obs :425606 */
100 - 120  = '08. (100, 120] '   /* s_DANPSinC/exp_sup_DAN : 0.002  |||||||||||||||||||  exp_sup_DAN : 44351.12 ||||||||||||         Obs :261926 */
120 - 150  = '09. (120, 150] '   /* s_DANPSinC/exp_sup_DAN : 0.0018 |||||||||||||||||    exp_sup_DAN : 40981.23 |||||||||||          Obs :234285 */
150 - high = '10. (150, high]'   /* s_DANPSinC/exp_sup_DAN : 0.001  ||||||||||           exp_sup_DAN : 58234    ||||||||||||||||     Obs :328138 */
. = 'Missing'
;


VALUE ViviendasOtroRegimen

low - 30  = '01. (low, 30] '   /* s_DANPSinC/exp_sup_DAN : 0.0022 |||||||||||||||||||| exp_sup_DAN : 74702.38 ||||||||||||||||     Obs :459365 */
30 - 40   = '02. (30, 40]  '   /* s_DANPSinC/exp_sup_DAN : 0.002  ||||||||||||||||||   exp_sup_DAN : 87719.24 |||||||||||||||||||  Obs :556816 */
40 - 50   = '03. (40, 50]  '   /* s_DANPSinC/exp_sup_DAN : 0.0013 ||||||||||||         exp_sup_DAN : 93897.63 |||||||||||||||||||| Obs :603476 */
50 - 60   = '04. (50, 60]  '   /* s_DANPSinC/exp_sup_DAN : 0.0018 ||||||||||||||||     exp_sup_DAN : 66469.99 ||||||||||||||       Obs :451202 */
60 - 70   = '05. (60, 70]  '   /* s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||||      exp_sup_DAN : 50573    |||||||||||          Obs :338860 */
70 - 90   = '06. (70, 90]  '   /* s_DANPSinC/exp_sup_DAN : 0.0008 ||||||||             exp_sup_DAN : 47791.24 ||||||||||           Obs :316833 */
90 - high = '07. (90, high]'   /* s_DANPSinC/exp_sup_DAN : 0.001  ||||||||||           exp_sup_DAN : 46750.33 ||||||||||           Obs :282818 */
. = '02. (30, 40]'
;


VALUE TotalHogares

low - 340  = '01. (low, 340] '   /* s_DANPSinC/exp_sup_DAN : 0.0017 ||||||||||||||       exp_sup_DAN : 37410.27 ||||||||||||||       Obs :298696 */
340 - 440  = '02. (340, 440] '   /* s_DANPSinC/exp_sup_DAN : 0.0013 ||||||||||           exp_sup_DAN : 42985.24 ||||||||||||||||     Obs :309734 */
440 - 490  = '03. (440, 490] '   /* s_DANPSinC/exp_sup_DAN : 0.0018 ||||||||||||||       exp_sup_DAN : 47089.82 |||||||||||||||||    Obs :318017 */
490 - 520  = '04. (490, 520] '   /* s_DANPSinC/exp_sup_DAN : 0.0014 |||||||||||          exp_sup_DAN : 38198.26 ||||||||||||||       Obs :252684 */
520 - 560  = '05. (520, 560] '   /* s_DANPSinC/exp_sup_DAN : 0.0025 |||||||||||||||||||| exp_sup_DAN : 52388.3  |||||||||||||||||||  Obs :327149 */
560 - 590  = '06. (560, 590] '   /* s_DANPSinC/exp_sup_DAN : 0.0011 |||||||||            exp_sup_DAN : 41990.69 |||||||||||||||      Obs :269247 */
590 - 630  = '07. (590, 630] '   /* s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||        exp_sup_DAN : 54629.38 |||||||||||||||||||| Obs :329175 */
630 - 700  = '08. (630, 700] '   /* s_DANPSinC/exp_sup_DAN : 0.0019 |||||||||||||||      exp_sup_DAN : 51463.89 |||||||||||||||||||  Obs :315669 */
700 - 800  = '09. (700, 800] '   /* s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||        exp_sup_DAN : 47170.41 |||||||||||||||||    Obs :281741 */
800 - high = '10. (800, high]'   /* s_DANPSinC/exp_sup_DAN : 0.0011 |||||||||            exp_sup_DAN : 54551.25 |||||||||||||||||||| Obs :307045 */
. = 'Missing'
;


VALUE Hogares1persona

low - 90   = '01. (low, 90]  '   /* s_DANPSinC/exp_sup_DAN : 0.0015 |||||||||||||        exp_sup_DAN : 41902.96 |||||||||||||        Obs :298763 */
90 - 110   = '02. (90, 110]  '   /* s_DANPSinC/exp_sup_DAN : 0.0013 ||||||||||||         exp_sup_DAN : 37933.36 ||||||||||||         Obs :256325 */
110 - 130  = '03. (110, 130] '   /* s_DANPSinC/exp_sup_DAN : 0.0019 |||||||||||||||||    exp_sup_DAN : 63936.31 |||||||||||||||||||| Obs :427423 */
130 - 140  = '04. (130, 140] '   /* s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||||      exp_sup_DAN : 44348.12 ||||||||||||||       Obs :296529 */
140 - 150  = '05. (140, 150] '   /* s_DANPSinC/exp_sup_DAN : 0.0019 |||||||||||||||||    exp_sup_DAN : 35662.25 |||||||||||          Obs :232012 */
150 - 160  = '06. (150, 160] '   /* s_DANPSinC/exp_sup_DAN : 0.0014 |||||||||||||        exp_sup_DAN : 41086.95 |||||||||||||        Obs :268334 */
160 - 170  = '07. (160, 170] '   /* s_DANPSinC/exp_sup_DAN : 0.0015 ||||||||||||||       exp_sup_DAN : 40715.72 |||||||||||||        Obs :254945 */
170 - 190  = '08. (170, 190] '   /* s_DANPSinC/exp_sup_DAN : 0.0022 |||||||||||||||||||| exp_sup_DAN : 55004.99 |||||||||||||||||    Obs :336294 */
190 - 230  = '09. (190, 230] '   /* s_DANPSinC/exp_sup_DAN : 0.0013 ||||||||||||         exp_sup_DAN : 55331.68 |||||||||||||||||    Obs :340552 */
230 - high = '10. (230, high]'   /* s_DANPSinC/exp_sup_DAN : 0.0012 |||||||||||          exp_sup_DAN : 51930.84 ||||||||||||||||     Obs :297773 */
. = 'Missing'
;


VALUE Hogares2personas

low - 90   = '01. (low, 90]  '   /* s_DANPSinC/exp_sup_DAN : 0.0017 ||||||||||||||       exp_sup_DAN : 34710.6  ||||||||||||         Obs :277366 */
90 - 120   = '02. (90, 120]  '   /* s_DANPSinC/exp_sup_DAN : 0.0011 |||||||||            exp_sup_DAN : 45832.94 ||||||||||||||||     Obs :326187 */
120 - 140  = '03. (120, 140] '   /* s_DANPSinC/exp_sup_DAN : 0.0015 |||||||||||||        exp_sup_DAN : 58985.87 |||||||||||||||||||| Obs :411435 */
140 - 150  = '04. (140, 150] '   /* s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||        exp_sup_DAN : 43580.08 |||||||||||||||      Obs :287852 */
150 - 160  = '05. (150, 160] '   /* s_DANPSinC/exp_sup_DAN : 0.0016 ||||||||||||||       exp_sup_DAN : 48978.42 |||||||||||||||||    Obs :309902 */
160 - 170  = '06. (160, 170] '   /* s_DANPSinC/exp_sup_DAN : 0.0023 |||||||||||||||||||| exp_sup_DAN : 58766.59 |||||||||||||||||||| Obs :353079 */
170 - 180  = '07. (170, 180] '   /* s_DANPSinC/exp_sup_DAN : 0.0018 ||||||||||||||||     exp_sup_DAN : 37673.16 |||||||||||||        Obs :228191 */
180 - 190  = '08. (180, 190] '   /* s_DANPSinC/exp_sup_DAN : 0.0018 |||||||||||||||      exp_sup_DAN : 33039.07 |||||||||||          Obs :196916 */
190 - 220  = '09. (190, 220] '   /* s_DANPSinC/exp_sup_DAN : 0.0017 |||||||||||||||      exp_sup_DAN : 56415.69 |||||||||||||||||||  Obs :337388 */
220 - high = '10. (220, high]'   /* s_DANPSinC/exp_sup_DAN : 0.001  |||||||||            exp_sup_DAN : 49921.4  |||||||||||||||||    Obs :281054 */
. = 'Missing'
;


VALUE Hogares3personas

low - 60   = '01. (low, 60]  '   /* s_DANPSinC/exp_sup_DAN : 0.0017 ||||||||||||||||||   exp_sup_DAN : 34155.11 ||||||||||           Obs :279393 */
60 - 80    = '02. (60, 80]   '   /* s_DANPSinC/exp_sup_DAN : 0.0013 |||||||||||||        exp_sup_DAN : 33997.25 ||||||||||           Obs :238216 */
80 - 100   = '03. (80, 100]  '   /* s_DANPSinC/exp_sup_DAN : 0.0018 |||||||||||||||||||  exp_sup_DAN : 70528    |||||||||||||||||||| Obs :473329 */
100 - 110  = '04. (100, 110] '   /* s_DANPSinC/exp_sup_DAN : 0.0019 |||||||||||||||||||| exp_sup_DAN : 47920.53 ||||||||||||||       Obs :305626 */
110 - 120  = '05. (110, 120] '   /* s_DANPSinC/exp_sup_DAN : 0.0019 |||||||||||||||||||| exp_sup_DAN : 42637.43 ||||||||||||         Obs :280431 */
120 - 130  = '06. (120, 130] '   /* s_DANPSinC/exp_sup_DAN : 0.0014 |||||||||||||||      exp_sup_DAN : 54565.6  |||||||||||||||      Obs :351624 */
130 - 140  = '07. (130, 140] '   /* s_DANPSinC/exp_sup_DAN : 0.0016 |||||||||||||||||    exp_sup_DAN : 43437.9  ||||||||||||         Obs :266034 */
140 - 150  = '08. (140, 150] '   /* s_DANPSinC/exp_sup_DAN : 0.0017 ||||||||||||||||||   exp_sup_DAN : 38392.5  |||||||||||          Obs :226586 */
150 - 170  = '09. (150, 170] '   /* s_DANPSinC/exp_sup_DAN : 0.0017 ||||||||||||||||||   exp_sup_DAN : 50914.07 ||||||||||||||       Obs :300661 */
170 - high = '10. (170, high]'   /* s_DANPSinC/exp_sup_DAN : 0.0011 |||||||||||          exp_sup_DAN : 51355.44 |||||||||||||||      Obs :287470 */
. = 'Missing'
;


VALUE Hogares4personas

low - 40   = '01. (low, 40]  '   /* s_DANPSinC/exp_sup_DAN : 0.0018 ||||||||||||||||||   exp_sup_DAN : 32242.82 |||||||||            Obs :260698 */
40 - 60    = '02. (40, 60]   '   /* s_DANPSinC/exp_sup_DAN : 0.0014 ||||||||||||||       exp_sup_DAN : 49186.62 |||||||||||||        Obs :333544 */
60 - 70    = '03. (60, 70]   '   /* s_DANPSinC/exp_sup_DAN : 0.002  |||||||||||||||||||| exp_sup_DAN : 38764.24 ||||||||||           Obs :251091 */
70 - 80    = '04. (70, 80]   '   /* s_DANPSinC/exp_sup_DAN : 0.0015 |||||||||||||||      exp_sup_DAN : 41239.22 |||||||||||          Obs :270733 */
80 - 90    = '05. (80, 90]   '   /* s_DANPSinC/exp_sup_DAN : 0.0014 ||||||||||||||       exp_sup_DAN : 46428.73 ||||||||||||         Obs :300347 */
90 - 100   = '06. (90, 100]  '   /* s_DANPSinC/exp_sup_DAN : 0.0014 ||||||||||||||       exp_sup_DAN : 44233.91 ||||||||||||         Obs :281644 */
100 - 110  = '07. (100, 110] '   /* s_DANPSinC/exp_sup_DAN : 0.0018 ||||||||||||||||||   exp_sup_DAN : 43386.31 ||||||||||||         Obs :280699 */
110 - 130  = '08. (110, 130] '   /* s_DANPSinC/exp_sup_DAN : 0.002  |||||||||||||||||||  exp_sup_DAN : 74866.96 |||||||||||||||||||| Obs :468283 */
130 - 150  = '09. (130, 150] '   /* s_DANPSinC/exp_sup_DAN : 0.0014 ||||||||||||||       exp_sup_DAN : 47097.83 |||||||||||||        Obs :281626 */
150 - high = '10. (150, high]'   /* s_DANPSinC/exp_sup_DAN : 0.0012 ||||||||||||         exp_sup_DAN : 50455.28 |||||||||||||        Obs :280657 */
. = 'Missing'
;


VALUE HogaresMas4personas

low - 20  = '01. (low, 20] '   /* s_DANPSinC/exp_sup_DAN : 0.0015 |||||||||||||||      exp_sup_DAN : 57455.9   |||||||||||          Obs :451374 */
20 - 30   = '02. (20, 30]  '   /* s_DANPSinC/exp_sup_DAN : 0.002  |||||||||||||||||||| exp_sup_DAN : 92814.74  ||||||||||||||||||   Obs :604789 */
30 - 40   = '03. (30, 40]  '   /* s_DANPSinC/exp_sup_DAN : 0.0015 |||||||||||||||      exp_sup_DAN : 104180.93 |||||||||||||||||||| Obs :652958 */
40 - 50   = '04. (40, 50]  '   /* s_DANPSinC/exp_sup_DAN : 0.0018 ||||||||||||||||||   exp_sup_DAN : 74072.17  ||||||||||||||       Obs :467343 */
50 - 60   = '05. (50, 60]  '   /* s_DANPSinC/exp_sup_DAN : 0.0016 ||||||||||||||||     exp_sup_DAN : 51747.58  ||||||||||           Obs :314549 */
60 - 70   = '06. (60, 70]  '   /* s_DANPSinC/exp_sup_DAN : 0.0012 ||||||||||||         exp_sup_DAN : 35992.74  |||||||              Obs :220508 */
70 - high = '07. (70, high]'   /* s_DANPSinC/exp_sup_DAN : 0.0011 |||||||||||          exp_sup_DAN : 51482.15  ||||||||||           Obs :296383 */
. = 'Missing'
;


RUN;