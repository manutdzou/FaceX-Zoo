export OMP_NUM_THREADS=4
python3 -m torch.distributed.launch --nproc_per_node=4 --nnodes=1 --node_rank=0 --master_addr="10.207.177.250" --master_port=1324 train.py --data_root '/home/wangjun492/wj_data/facex-zoo/deepglint/msra_crop' --train_file '/home/wangjun492/wj_data/facex-zoo/deepglint/msceleb_deepglint_train_file.txt' --backbone_type 'ResNet' --backbone_conf_file '../backbone_conf.yaml' --head_type 'MV-Softmax' --head_conf_file '../head_conf.yaml' --lr 0.1 --out_dir 'out_dir' --epoches 18 --step '10,13,16' --print_freq 200 --save_freq 3000 --batch_size 128 --momentum 0.9 --log_dir 'log' --tensorboardx_logdir 'mv-resnet' 2>&1 | tee log.log