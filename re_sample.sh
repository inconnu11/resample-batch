# data_dir=$1
# tar_dir=$2


# cnt=0
# for file in $data_dir/*; do
# 	mkdir $tar_dir/$file
# 	for f in $file/*.wav; do
# 		sox $f -r 16000 tmp_$f
# 		cp tmp_$f $tar_dir/$file
# 		mv $tar_dir/$file/${tmp_$f} $tar_dir/$file/$f
# 	done
# done

# echo "$cnt wavs are analysized!"
# echo "Finished!"
# exit 1;

#! /bin/bash

data_dir=$1
tgt_dir=$2

cnt=0
for file in $data_dir/*; do
	sp=$(basename -- "$file")
	mkdir $tgt_dir/$sp
	for f in $file/*.wav; do
		let "cnt += 1"
		filename=$(basename -- "$f")
		filename="${filename%.*}"
		uttids="$filename"
		echo "$tgt_dir"/"$uttids"
		sox $f -r 16000 $tgt_dir/$sp/$uttids.wav
		# sox $f -r 16000 ${uttids}_down.wav
		# cp ${uttids}_down.wav $tgt_dir/$sp
		# mv $tgt_dir/${uttids}_down.wav $tgt_dir/$sp/$uttids.wav
	done
done

echo "$cnt wavs are analysized!"
echo "Finished!"
exit 1;
