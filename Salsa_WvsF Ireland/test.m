data.tL_scoAa = [ ... % time since birth ( 2May) (d), fork length (cm)
270	6.50 % 1 Feb 30*9
300	6.50 % 1 MAr 30*10
330	6.59 % 1 apr 30*11
360	7.11 % 1 May 30*12
390	7.78 % 1 Jun 30*13
420	8.71 % 1 Jul 30*14
450	9.6  % 1 Aug 30*15
480	10.47 %1 Sep 30*16
510	10.83 %1 Oct 30*17
540	11.46 %1 Nov 30*18
570	11.70];%1Dec 30*19
units.tL_scoAa   = {'d', 'cm'};  label.tL_scoAa = {'time since birth', 'total length'}; 
bibkey.tL_scoAa = 'Rowe1990'; comment.tL_scoAa = 'Shin River (Scotland), only lower modal group, fork length, fig 3';
temp.tL_scoAa    = [    
-122	0.014
-116	-0.173
-111	-0.181
-108	0.596
-103	1.344
-98	1.215
-93	1.767
-88	2.029
-82	1.243
-76	1.068
-72	1.459
-67	2.185
-61	2.204
-56	2.12
-50	2.185
-44	2.164
-39	2.737
-34	3.477
-29	4.306
-24	4.606
-20	5.099
-18	6.014
-16	6.966
-15	7.802
-13	8.539
-11	9.411
-8	10.115
-4	10.916
-1	11.798
4	12.118
9	11.233
10	10.891
13	11.883
16	12.665
20	13.406
25	13.335
31	13.14
35	12.472
38	11.718
42	11.495
47	12.515
51	13.116
55	13.567
57	14.521
59	15.399
63.5	16.425
63	16.963
67	15.827
72	15.323
76	16.262
80	16.689
85	16.251
89	15.497
94	15.011
100	15.769
106	16.23
111	15.992
114	15.241
118	14.697
123	14.506
127	13.645
129	12.907
132	12.102
135	11.418
140	10.571
145	10.035
150	9.294
153	8.521
156	7.764
161	7.039
166	7.006
171	6.728
176	5.963
182	6.205
186	6.024
190	5.154
194	5.016
199	5.549
203	4.394
204	3.621
207	2.733
210	2.54
215	2.522
219	1.577
223	1.225
227	2.186
230	2.923
232	3.76
234	4.676
236	5.32
243	0.014
249	-0.173
254	-0.181
257	0.596
262	1.344
267	1.215
272	1.767
277	2.029
283	1.243
289	1.068
293	1.459
298	2.185
304	2.204
309	2.12
315	2.185
321	2.164
326	2.737
331	3.477
336	4.306
341	4.606
345	5.099
347	6.014
349	6.966
350	7.802
352	8.539
354	9.411
357	10.115
361	10.916
364	11.798
369	12.118
374	11.233
375	10.891
378	11.883
381	12.665
385	13.406
390	13.335
396	13.14
400	12.472
403	11.718
407	11.495
412	12.515
416	13.116
420	13.567
422	14.521
424	15.399
428	16.425
428.5	16.963
432	15.827
437	15.323
441	16.262
445	16.689
450	16.251
454	15.497
459	15.011
465	15.769
471	16.23
476	15.992
479	15.241
483	14.697
488	14.506
492	13.645
494	12.907
497	12.102
500	11.418
505	10.571
510	10.035
515	9.294
518	8.521
521	7.764
526	7.039
531	7.006
536	6.728
541	5.963
547	6.205
551	6.024
555	5.154
559	5.016
564	5.549
568	4.394
569	3.621
572	2.733
575	2.54
580	2.522
584	1.577
588	1.225
592	2.186
595	2.923
597	3.76
599	4.676
601	5.32];
temp.tL_scoAa(:,2) = C2K(temp.tL_scoAa(:,2));
units.temp.tL_scoAa = 'K'; label.temp.tL_scoAa = 'temperature'; comment.temp.tL_scoAa = 'T° in Almond river from May to August, Fig1';

TC = interp1(temp.tL_scoAa(:,1), temp.tL_scoAa(:,2), data.tL_scoAa(:,1));
% TC = tempcorr(interp1(temp.tL_scoAa(:,1), temp.tL_scoAa(:,2), data.tL_scoAa(:,1)), 296.15, 5190);
TC
plot(data.tL_scoAa(:,1), TC, "red")
line(temp.tL_scoAa(temp.tL_scoAa(:,1)>265,1),temp.tL_scoAa(temp.tL_scoAa(:,1)>265,2))