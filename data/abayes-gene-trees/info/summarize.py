import pandas
import numpy
import sys

for dtype in ["CNEE", "intron", "UCE"]:
    df1 = pandas.read_csv(dtype + "_alignment_info.csv")
    df2 = pandas.read_csv(dtype + "_branch_support.csv")

    al_avg = round(numpy.mean(df1.ALEN.values))
    al_std = round(numpy.std(df1.ALEN.values))

    np_avg = round(numpy.mean(df1.NPIP.values))
    np_std = round(numpy.std(df1.NPIP.values))

    sv_avg = round(round(numpy.mean(df2.SAVG.values), 4), 3)
    sv_std = round(round(numpy.std(df2.SAVG.values), 4), 3)

    sm_avg = round(round(numpy.mean(df2.SMED.values), 4), 3)
    sm_std = round(round(numpy.std(df2.SMED.values), 4), 3)

    sys.stdout.write("%s | %d &pm; %d | %d &pm; %d | %1.3f &pm; %1.3f | %1.3f &pm; %1.3f\n" %
            (dtype, al_avg, al_std, np_avg, np_std, sv_avg, sv_std, sm_avg, sm_std))

"""
CNEE | 378 &pm; 149 | 21 &pm; 15 | 0.530 &pm; 0.116 | 0.573 &pm; 0.309
intron | 5560 &pm; 7165 | 1211 &pm; 1489 | 0.850 &pm; 0.094 | 0.985 &pm; 0.056
UCE | 2676 &pm; 685 | 430 &pm; 183 | 0.839 &pm; 0.066 | 0.994 &pm; 0.032
"""
