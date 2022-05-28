#!/bin/bash

merged_file=./exp3/exp3_all_merged.dict
output_dir=./exp3/splited_data/
regex_num='0-9'
regex_lower='a-z'
regex_upper='A-Z'

mkdir -p $output_dir
#wc -l $f | cut -f1 -d' '

#class1
for i in {11..16}
do
        #decimal_only
        output_prefix="${output_dir}exp3_${i}_cls1_d"
        output_all="${output_prefix}_all.dict"
        output_tr="${output_prefix}_tr.dict"
        output_ts="${output_prefix}_ts.dict"
        cat $merged_file | grep -x "[${regex_num}]\{${i},${i}\}" > $output_all
        
        lines=`wc -l $output_all | cut -f1 -d' '`
        cut_line=$(($lines * 8 / 10 + 1))

        csplit -f $output_prefix $output_all $cut_line
        mv ${output_prefix}00 $output_tr
        mv ${output_prefix}01 $output_ts

        #upper_only
        output_prefix="${output_dir}exp3_${i}_cls1_u"
        output_all="${output_prefix}_all.dict"
        output_tr="${output_prefix}_tr.dict"
        output_ts="${output_prefix}_ts.dict"
        cat $merged_file | grep -x "[${regex_upper}]\{${i},${i}\}" > $output_all

        lines=`wc -l $output_all | cut -f1 -d' '`
        cut_line=$(($lines * 8 / 10 + 1))

        csplit -f $output_prefix $output_all $cut_line
        mv ${output_prefix}00 $output_tr
        mv ${output_prefix}01 $output_ts

        #lower_only
        output_prefix="${output_dir}exp3_${i}_cls1_l"
        output_all="${output_prefix}_all.dict"
        output_tr="${output_prefix}_tr.dict"
        output_ts="${output_prefix}_ts.dict"
        cat $merged_file | grep -x "[${regex_lower}]\{${i},${i}\}" > $output_all

        lines=`wc -l $output_all | cut -f1 -d' '`
        cut_line=$(($lines * 8 / 10 + 1))

        csplit -f $output_prefix $output_all $cut_line
        mv ${output_prefix}00 $output_tr
        mv ${output_prefix}01 $output_ts

        #spec_only
        output_prefix="${output_dir}exp3_${i}_cls1_s"
        output_all="${output_prefix}_all.dict"
        output_tr="${output_prefix}_tr.dict"
        output_ts="${output_prefix}_ts.dict"
        cat $merged_file | grep -x "[^${regex_num}${regex_upper}${regex_lower}]\{${i},${i}\}" > $output_all
        
        lines=`wc -l $output_all | cut -f1 -d' '`
        cut_line=$(($lines * 8 / 10 + 1))

        csplit -f $output_prefix $output_all $cut_line
        mv ${output_prefix}00 $output_tr
        mv ${output_prefix}01 $output_ts

done

#class2

for i in {11..16}
do
        #deciaml && upper
        output_prefix="${output_dir}exp3_${i}_cls2_du"
        output_all="${output_prefix}_all.dict"
        output_tr="${output_prefix}_tr.dict"
        output_ts="${output_prefix}_ts.dict"
        cat $merged_file | grep -x "[${regex_num}${regex_upper}]\{${i},${i}\}" > $output_all
        
        lines=`wc -l $output_all | cut -f1 -d' '`
        cut_line=$(($lines * 8 / 10 + 1))

        csplit -f $output_prefix $output_all $cut_line
        mv ${output_prefix}00 $output_tr
        mv ${output_prefix}01 $output_ts


        #decimal && lower
        output_prefix="${output_dir}exp3_${i}_cls2_dl"
        output_all="${output_prefix}_all.dict"
        output_tr="${output_prefix}_tr.dict"
        output_ts="${output_prefix}_ts.dict"
        cat $merged_file | grep -x "[${regex_num}${regex_lower}]\{${i},${i}\}" > $output_all
        
        lines=`wc -l $output_all | cut -f1 -d' '`
        cut_line=$(($lines * 8 / 10 + 1))

        csplit -f $output_prefix $output_all $cut_line
        mv ${output_prefix}00 $output_tr
        mv ${output_prefix}01 $output_ts


        #deciaml && special
        output_prefix="${output_dir}exp3_${i}_cls2_ds"
        output_all="${output_prefix}_all.dict"
        output_tr="${output_prefix}_tr.dict"
        output_ts="${output_prefix}_ts.dict"
        cat $merged_file | grep -x "[^${regex_upper}${regex_lower}]\{${i},${i}\}" > $output_all
        
        lines=`wc -l $output_all | cut -f1 -d' '`
        cut_line=$(($lines * 8 / 10 + 1))

        csplit -f $output_prefix $output_all $cut_line
        mv ${output_prefix}00 $output_tr
        mv ${output_prefix}01 $output_ts


        #upper && lower
        output_prefix="${output_dir}exp3_${i}_cls2_ul"
        output_all="${output_prefix}_all.dict"
        output_tr="${output_prefix}_tr.dict"
        output_ts="${output_prefix}_ts.dict"
        cat $merged_file | grep -x "[${regex_upper}${regex_lower}]\{${i},${i}\}" > $output_all
        
        lines=`wc -l $output_all | cut -f1 -d' '`
        cut_line=$(($lines * 8 / 10 + 1))

        csplit -f $output_prefix $output_all $cut_line
        mv ${output_prefix}00 $output_tr
        mv ${output_prefix}01 $output_ts


        #upper && special
        output_prefix="${output_dir}exp3_${i}_cls2_us"
        output_all="${output_prefix}_all.dict"
        output_tr="${output_prefix}_tr.dict"
        output_ts="${output_prefix}_ts.dict"
        cat $merged_file | grep -x "[${regex_num}${regex_lower}]\{${i},${i}\}" > $output_all
        
        lines=`wc -l $output_all | cut -f1 -d' '`
        cut_line=$(($lines * 8 / 10 + 1))

        csplit -f $output_prefix $output_all $cut_line
        mv ${output_prefix}00 $output_tr
        mv ${output_prefix}01 $output_ts

        #lower && special
        output_prefix="${output_dir}exp3_${i}_cls2_ls"
        output_all="${output_prefix}_all.dict"
        output_tr="${output_prefix}_tr.dict"
        output_ts="${output_prefix}_ts.dict"
        cat $merged_file | grep -x "[^${regex_num}${regex_upper}]\{${i},${i}\}" > $output_all
        
        lines=`wc -l $output_all | cut -f1 -d' '`
        cut_line=$(($lines * 8 / 10 + 1))

        csplit -f $output_prefix $output_all $cut_line
        mv ${output_prefix}00 $output_tr
        mv ${output_prefix}01 $output_ts

done
#class3
for i in {11..16}
do
        #without decimal
        output_prefix="${output_dir}exp3_${i}_cls3_uls"
        output_all="${output_prefix}_all.dict"
        output_tr="${output_prefix}_tr.dict"
        output_ts="${output_prefix}_ts.dict"
        cat $merged_file | grep -x "[^${regex_num}]\{${i},${i}\}" > $output_all
        
        lines=`wc -l $output_all | cut -f1 -d' '`
        cut_line=$(($lines * 8 / 10 + 1))

        csplit -f $output_prefix $output_all $cut_line
        mv ${output_prefix}00 $output_tr
        mv ${output_prefix}01 $output_ts

        #without upper
        output_prefix="${output_dir}exp3_${i}_cls3_dls"
        output_all="${output_prefix}_all.dict"
        output_tr="${output_prefix}_tr.dict"
        output_ts="${output_prefix}_ts.dict"
        cat $merged_file | grep -x "[^${regex_upper}]\{${i},${i}\}" > $output_all

        lines=`wc -l $output_all | cut -f1 -d' '`
        cut_line=$(($lines * 8 / 10 + 1))

        csplit -f $output_prefix $output_all $cut_line
        mv ${output_prefix}00 $output_tr
        mv ${output_prefix}01 $output_ts

        #without lower
        output_prefix="${output_dir}exp3_${i}_cls3_dus"
        output_all="${output_prefix}_all.dict"
        output_tr="${output_prefix}_tr.dict"
        output_ts="${output_prefix}_ts.dict"
        cat $merged_file | grep -x "[^${regex_lower}]\{${i},${i}\}" > $output_all

        lines=`wc -l $output_all | cut -f1 -d' '`
        cut_line=$(($lines * 8 / 10 + 1))

        csplit -f $output_prefix $output_all $cut_line
        mv ${output_prefix}00 $output_tr
        mv ${output_prefix}01 $output_ts

        #without special
        output_prefix="${output_dir}exp3_${i}_cls3_dul"
        output_all="${output_prefix}_all.dict"
        output_tr="${output_prefix}_tr.dict"
        output_ts="${output_prefix}_ts.dict"
        cat $merged_file | grep -x "[${regex_num}${regex_upper}${regex_lower}]\{${i},${i}\}" > $output_all
        
        lines=`wc -l $output_all | cut -f1 -d' '`
        cut_line=$(($lines * 8 / 10 + 1))

        csplit -f $output_prefix $output_all $cut_line
        mv ${output_prefix}00 $output_tr
        mv ${output_prefix}01 $output_ts

done


#class4
for i in {11..16}
do
        #everything
        output_prefix="${output_dir}exp3_${i}_cls3_dul"
        output_all="${output_prefix}_all.dict"
        output_tr="${output_prefix}_tr.dict"
        output_ts="${output_prefix}_ts.dict"
        cat $merged_file | grep -x ".\{${i},${i}\}" > $output_all
        
        lines=`wc -l $output_all | cut -f1 -d' '`
        cut_line=$(($lines * 8 / 10 + 1))

        csplit -f $output_prefix $output_all $cut_line
        mv ${output_prefix}00 $output_tr
        mv ${output_prefix}01 $output_ts
done
