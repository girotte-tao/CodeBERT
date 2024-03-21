#!/bin/bash
mkdir -p saved_models

# 定义日志目录和文件名
LOG_DIR="log"
LOG_FILE="${LOG_DIR}/$(date +%Y-%m-%d_%H-%M-%S).log"

# 确保日志目录存在
mkdir -p ${LOG_DIR}

# 运行脚本并将输出重定向到日志文件
python run.py \
    --output_dir=saved_models \
    --config_name=microsoft/graphcodebert-base \
    --model_name_or_path=microsoft/graphcodebert-base \
    --tokenizer_name=microsoft/graphcodebert-base \
    --do_train \
    --train_data_file=dataset/train.txt \
    --eval_data_file=dataset/valid.txt \
    --test_data_file=dataset/test.txt \
    --epoch 1 \
    --code_length 512 \
    --data_flow_length 128 \
    --train_batch_size 4 \
    --eval_batch_size 4 \
    --learning_rate 2e-5 \
    --max_grad_norm 1.0 \
    --evaluate_during_training \
    --seed 123456 > "${LOG_FILE}" 2>&1
