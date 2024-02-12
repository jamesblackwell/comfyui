

After building run something like: 

```
docker tag ghcr.io/ai-dock/comfyui:jupyter-pytorch-2.2.0-py3.10-cuda-11.8.0-runtime-22.04 jwblackwell/comfyui:lucidpic-comfyui-v3


docker push jwblackwell/comfyui:lucidpic-comfyui-v3
```

You'll probably need to update the tag e.g. comfyui:jupyter-pytorch... to whatever is displayed. 


