---
#
# This YAML frontmatter is read by an AI agent during snap creation and then removed from the README.
#

# Snap name. This is exposed as a command when installing the snap.
snap-name: gemma4
# Snap title, a friendly name for the snap, used in snap metadata and docs.
snap-title: Gemma 4
# URL to model card from the model publisher
model-card: https://ai.google.dev/gemma/docs/core/model_card_4
# The port that the inference snap will use for its API server.
http-port: 8080
# The port that the inference snap will use for its webui server.
webui-http-port: 8081
# Optimizations
engines: cpu, nvidia-gpu
---

> [!NOTE]
> This README is a template that is be read and completed by an AI agent to create an inference snap.
> 
> Complete the [Makefile](./Makefile) and the above YAML frontmatter. Leave everything else to the AI agent.
> Fields wrapped in `{...}` will be replaced with concrete values by the AI agent. This note and the YAML frontmatter will be deleted.
>
> Launch a [Workshop](https://ubuntu.com/workshop) environment with everything you need to create the snap:
> ```shell
> workshop launch
> workshop shell
> opencode
> ```
> Choose the preferred LLM in OpenCode and prompt `start packing pipeline` to start the snap creation process.
> The snap will be developed, built and tested automatically in the workshop environment.
> 
> If this is the first time doing this, refer to [Using an AI agent to create an inference snap](https://documentation.ubuntu.com/inference-snaps/tutorial/agentic-inference-snap-creation/) tutorial.

# {snap-title} inference snap
[![{snap-name}](https://snapcraft.io/{snap-name}/badge.svg)](https://snapcraft.io/{snap-name})



{model description}

Use this snap to quickly install an optimized environment for local inference with {snap-title}.

The snap includes the following hardware-optimized inference engines:

* cpu: Optimized for x64 and ARM (armv8, armv9) CPUs
* nvidia-gpu: CUDA-enabled GPU acceleration
* {engine}: {description}

The most suitable engine is automatically selected based on the available hardware.

#### Install
```
sudo snap install {snap-name}
```

#### Run
```
{snap-name}
```

> [!TIP]
> Some accelerators require extra [drivers](https://documentation.ubuntu.com/inference-snaps/how-to/setup/drivers/) to be usable with this snap.

## Resources

📚 **[Documentation](https://documentation.ubuntu.com/inference-snaps/)**, learn how to use inference snaps

💬 **[Discussions](https://github.com/canonical/inference-snaps/discussions)**, ask questions and share ideas

🐛 **[Issues](https://github.com/canonical/inference-snaps/issues)**, report bugs and request features

## Build and install from source

Clone the repo:
```shell
git clone https://github.com/{owner}/{repository}
cd {repository}
```

Initialize the development environment:
```shell
make init
```

Build and install snap:
```shell
make build
make install
```
