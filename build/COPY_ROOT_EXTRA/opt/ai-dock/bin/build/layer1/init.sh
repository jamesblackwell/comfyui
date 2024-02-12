#!/bin/bash

# Use this layer to add nodes and models

NODES=(
    "https://github.com/ltdrdata/ComfyUI-Manager"
    "https://github.com/cubiq/ComfyUI_IPAdapter_plus"
    "https://github.com/ltdrdata/ComfyUI-Impact-Pack"
    "https://github.com/ltdrdata/ComfyUI-Inspire-Pack"
    "https://github.com/WASasquatch/was-node-suite-comfyui"
    "https://github.com/ssitu/ComfyUI_UltimateSDUpscale"
    "https://github.com/ZHO-ZHO-ZHO/ComfyUI-InstantID" 
    # keep for now if no issues
    "https://github.com/Gourieff/comfyui-reactor-node"
    "https://github.com/wmatson/easy-comfy-nodes"
    # do we need? 
    "https://github.com/drmz09520/DZ-FaceDetailer"
    # "https://github.com/nosiu/comfyui-instantId-faceswap" 
)

CHECKPOINT_MODELS=(
    # download locally and put in ./build/COPY_ROOT_EXTRA/opt/storage/stable_diffusion/models/ckpt to speed up the build? 
    # "https://civitai.com/api/download/models/28100?type=Model&format=SafeTensor&size=full&fp=fp32"

    # epicphotogasm
    "https://civitai.com/api/download/models/177124?type=Model&format=SafeTensor&size=pruned&fp=fp16"

    # realistic stock photo
    # "https://civitai.com/api/download/models/294470?type=Model&format=SafeTensor&size=pruned&fp=fp16"
)

CLIP_VISION_MODELS=(
    # for ip adapater (vit-h)
    "https://huggingface.co/h94/IP-Adapter/resolve/main/models/image_encoder/model.safetensors"
)

IPADAPTER_MODELS=(
    "https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-plus-face_sd15.safetensors"
    # "https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus-face_sdxl_vit-h.safetensors"
)

FACERESTORE_MODELS=(
    "https://github.com/sczhou/CodeFormer/releases/download/v0.1.0/codeformer.pth"
)

INSIGHTFACE_MODELS=(
    # for reactor
    "https://github.com/facefusion/facefusion-assets/releases/download/models/inswapper_128.onnx"
)

LORA_MODELS=(
    "https://civitai.com/api/download/models/62833"
    # https://huggingface.co/latent-consistency/lcm-lora-sdxl/resolve/main/pytorch_lora_weights.safetensors?download=true
)

EMBEDDINGS=(
    # again, put in ./build/COPY_ROOT_EXTRA/opt/storage/stable_diffusion/models/embeddings
    "https://civitai.com/api/download/models/20068"
    "https://civitai.com/api/download/models/9208"
)

VAE_MODELS=(
    # "https://huggingface.co/stabilityai/sd-vae-ft-ema-original/resolve/main/vae-ft-ema-560000-ema-pruned.safetensors"
    "https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors"
    # "https://huggingface.co/stabilityai/sdxl-vae/resolve/main/sdxl_vae.safetensors"
)

ESRGAN_MODELS=(
    "https://huggingface.co/ai-forever/Real-ESRGAN/resolve/main/RealESRGAN_x4.pth"
    "https://huggingface.co/FacehugmanIII/4x_foolhardy_Remacri/resolve/main/4x_foolhardy_Remacri.pth"
    # "https://huggingface.co/Akumetsu971/SD_Anime_Futuristic_Armor/resolve/main/4x_NMKD-Siax_200k.pth"
)

CONTROLNET_MODELS=(
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_canny-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_depth-fp16.safetensors"
    #"https://huggingface.co/kohya-ss/ControlNet-diff-modules/resolve/main/diff_control_sd15_depth_fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_hed-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_mlsd-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_normal-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_openpose-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_scribble-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_seg-fp16.safetensors"
    # "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_canny-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_color-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_depth-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_keypose-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_openpose-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_seg-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_sketch-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_style-fp16.safetensors"
)

### DO NOT EDIT BELOW HERE UNLESS YOU KNOW WHAT YOU ARE DOING ###

function build_extra_start() {
    build_extra_get_nodes
    build_extra_get_models \
        "/opt/storage/stable_diffusion/models/ckpt" \
        "${CHECKPOINT_MODELS[@]}"
    build_extra_get_models \
        "/opt/storage/stable_diffusion/models/lora" \
        "${LORA_MODELS[@]}"
    build_extra_get_models \
        "/opt/storage/stable_diffusion/models/controlnet" \
        "${CONTROLNET_MODELS[@]}"
    build_extra_get_models \
        "/opt/storage/stable_diffusion/models/vae" \
        "${VAE_MODELS[@]}"
    build_extra_get_models \
        "/opt/storage/stable_diffusion/models/esrgan" \
        "${ESRGAN_MODELS[@]}"
    build_extra_get_models \
        "/opt/storage/stable_diffusion/models/clip_vision" \
        "${CLIP_VISION_MODELS[@]}"
    build_extra_get_models \
        "/opt/storage/stable_diffusion/models/ipadapter" \
        "${IPADAPTER_MODELS[@]}"
    build_extra_get_models \
        "/opt/storage/stable_diffusion/models/facerestore" \
        "${FACERESTORE_MODELS[@]}"
    build_extra_get_models \
        "/opt/storage/stable_diffusion/models/insightface" \
        "${INSIGHTFACE_MODELS[@]}"
    build_extra_get_models \
        "/opt/storage/stable_diffusion/models/embeddings" \
        "${EMBEDDINGS[@]}"
     
    cd /opt/ComfyUI && \
    micromamba run -n comfyui -e LD_PRELOAD=libtcmalloc.so python main.py \
        --cpu \
        --listen 127.0.0.1 \
        --port 11404 \
        --disable-auto-launch \
        --quick-test-for-ci
    
    # Ensure pytorch hasn't been clobbered
    $MAMBA_DEFAULT_RUN python /opt/ai-dock/tests/assert-torch-version.py
}

function build_extra_get_nodes() {
    for repo in "${NODES[@]}"; do
        dir="${repo##*/}"
        path="/opt/ComfyUI/custom_nodes/${dir}"
        requirements="${path}/requirements.txt"
        if [[ -d $path ]]; then
            if [[ ${AUTO_UPDATE,,} != "false" ]]; then
                printf "Updating node: %s...\n" "${repo}"
                ( cd "$path" && git pull )
                if [[ -e $requirements ]]; then
                    micromamba -n comfyui run ${PIP_INSTALL} -r "$requirements"
                fi
            fi
        else
            printf "Downloading node: %s...\n" "${repo}"
            git clone "${repo}" "${path}" --recursive
            if [[ -e $requirements ]]; then
                micromamba -n comfyui run ${PIP_INSTALL} -r "${requirements}"
            fi
        fi
    done
}

function build_extra_get_models() {
    if [[ -n $2 ]]; then
        dir="$1"
        mkdir -p "$dir"
        shift
        arr=("$@")
        
        printf "Downloading %s model(s) to %s...\n" "${#arr[@]}" "$dir"
        for url in "${arr[@]}"; do
            printf "Downloading: %s\n" "${url}"
            build_extra_download "${url}" "${dir}"
            printf "\n"
        done
    fi
}

# Download from $1 URL to $2 file path
function build_extra_download() {
    wget -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
}

umask 002
build_extra_start
fix-permissions.sh -o container