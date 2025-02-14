# Copyright 2023 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

export LIBTPU_INIT_ARGS="--xla_enable_async_all_gather=true TPU_MEGACORE=MEGACORE_DENSE"
RUN_NAME=1x_v4-384_0013
python3 MaxText/train.py MaxText/configs/base.yml run_name=${RUN_NAME} enable_profiler=true enable_checkpointing=false steps=10 ici_fsdp_parallelism=192 ici_tensor_parallelism=1 scale=4 base_num_decoder_layers=8 per_device_batch_size=10 remat_policy=full base_emb_dim=3072 base_mlp_dim=12288 use_pjrt=0  learning_rate=1e-8
# achieves 154 TFLOP/s, 52B