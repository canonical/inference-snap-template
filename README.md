<!--
# This is the name of the snap. The name that is registered on the snap store and also the name of the cli command.
snap-name: gemma4
# This name is just a friendly name for the snap, it can be used in the documentation
snap-friendly-name: Gemma 4
# URL to model card from the model publisher
model-card: https://ai.google.dev/gemma/docs/core/model_card_4
# The port that the inference snap will use for its API server.
http-port: 8080
# The port that the inference snap will use for its webui server.
webui-http-port: 8081
# Optimizations
engines: cpu, nvidia-gpu
-->

# {snap-friendly-name} inference snap
[![{snap-name}](https://snapcraft.io/{snap-name}/badge.svg)](https://snapcraft.io/{snap-name})

> This README is a template. Fields wrapped in `{...}` should be replaced with concrete values. If you use an agentic workflow using the included [workshop](#develop-this-snap-in-workshop), the values will get filled automatically.

Install [{snap-friendly-name}]({model-card}), optimized directly for your hardware.
This package deploys a high-performance runtime for local inference across arm and x86 platforms. It runs efficiently on pure CPU or leverages hardware acceleration via {NVIDIA, Intel, or AMD GPUs}.

Before starting, install the necessary [drivers](https://documentation.ubuntu.com/inference-snaps/how-to/setup/drivers/) for your accelerator.

| Engine | Arch | Description |
|--------------|--------------|-------------|
| cpu | amd64, arm64 | Optimized for several CPU variants (x86, armv8, armv9) |
| intel-cpu | amd64 | Optimized for best performance on Intel CPUs |
| intel-gpu | amd64 | Optimized for Intel integrated and discrete graphics |
| nvidia-gpu | amd64, arm64 | CUDA-enabled GPU acceleration |
| {engine} | {arch} | {description} |

#### Install
```
sudo snap install {snap-name}
```
#### Use
```
{snap-name} --help
```

#### Default configurations
| Key | Value |
|-----|-------|
| http.port | {http-port}   |
| http.host | 127.0.0.1 |
| webui.http.port | {webui-http-port}  |
| webui.http.host | 127.0.0.1 |

## Resources

📚 **[Documentation](https://documentation.ubuntu.com/inference-snaps/)**, learn how to use inference snaps

💬 **[Discussions](https://github.com/canonical/inference-snaps/discussions)**, ask questions and share ideas

🐛 **[Issues](https://github.com/canonical/inference-snaps/issues)**, report bugs and request features

## Build and install from source

Clone this repo with its submodules:
```shell
git clone --recurse-submodules https://github.com/{owner}/{repository}
```

Prepare the required models by running `make download-models`.

Build the snap and its component:
```shell
snapcraft pack -v
```

Refer to the `./dev` directory for additional development tools.

## Develop this snap in a workshop

Start the `workshop` environment and pack the snap with AI agents:

```shell
workshop launch
workshop shell
opencode
```

Choose the preferred LLM in opencode and prompt `start packing pipeline` to start the snap creation process. The snap will be built and installed automatically in the workshop environment.
