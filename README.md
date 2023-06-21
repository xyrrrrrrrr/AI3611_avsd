# 跑 baseline 配置

baseline 用到 openl3 提取的 audio 和 visual 特征，此步骤过程较长，已预先提取好放于 `/lustre/home/acct-stu/stu168/ai3611/av_scene_classify/data/feature`，基于此跑 baseline (注意将环境初始化部分改成自己的设置):

```bash
sbatch run.sh
```

注: eval_pred.py 用于计算指标，预测结果 `prediction.csv` 写成这样的形式 (分隔符为 `\t`):
```
aid     scene_pred      airport     bus     ......  tram
airport-lisbon-1175-44106   airport     0.9   0.000   ......  0.001
......
```
调用方法：
```bash
python eval_prediction.py --prediction prediction.csv \
                          --label /dssg/home/acct-stu/stu464/data/audio_visual_scenes/evaluation_setup/fold1_evaluate.csv
```

# 修改配置
以上是直接使用已经划分好的 train / val 集以及预先提取好的音视频特征、模态融合方法，大家可以尝试自己修改这些内容
#   A I 3 6 1 1 _ a v s d  
 