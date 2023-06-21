#!/bin/bash

#SBATCH -p dgx2
#SBATCH -N 1
#SBATCH -c 4
#SBATCH --gres gpu:1
#SBATCH --output=slurm_logs/%j.out
#SBATCH --error=slurm_logs/%j.err
#SBATCH --mail-type=end           # 作业结束时，邮件提醒
#SBATCH --mail-user=raoxiangyun@sjtu.edu.cn

module load miniconda3
__conda_setup="$('/lustre/opt/cascadelake/linux-centos7-x86_64/gcc-4.8.5/miniconda3-4.8.2-5yczksexambgeule63z3smwiwrbokjtu/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
eval "$__conda_setup"
conda activate av_scene_classify

# training
python train.py --config_file configs/late_config.yaml

# evaluation
python evaluate.py --experiment_path experiments/late
