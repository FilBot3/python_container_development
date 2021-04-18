# vim: filetype=dockerfile
FROM docker.io/library/ubuntu:20.04

RUN apt-get update && apt-get upgrade -y

# https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-7.1
RUN apt update && \
    apt install -y wget curl apt-transport-https software-properties-common ca-certificates gnupg lsb-release && \
    wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt update && \
    add-apt-repository universe && \
    apt install -y powershell && \
    rm -f packages-microsoft-prod.deb

RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor | \
    tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null && \
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" | \
    tee /etc/apt/sources.list.d/azure-cli.list && \
    apt update && \
    apt install -y azure-cli && \
    az extension add --name azure-devops

RUN wget https://github.com/mikefarah/yq/releases/download/v4.6.1/yq_linux_amd64 && \
    echo "a339079fadf5e01d69067349b67db695db1a4f5046281713e35d9b6ca790b499  yq_linux_amd64" | sha256sum --check -- && \
    install -m 755 -D yq_linux_amd64 /usr/local/bin/yq && \
    rm yq_linux_amd64

RUN add-apt-repository ppa:neovim-ppa/stable && \
    apt update && \
    apt install -y neovim python3-dev python3-pip python-is-python3 python3-neovim

RUN update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60 && \
    update-alternatives --config vi && \
    update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60 && \
    update-alternatives --config vim && \
    update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60 && \
    update-alternatives --config editor

RUN apt update && \
    apt install -y apt-transport-https gnupg2 curl && \
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list && \
    apt update && \
    apt install -y kubectl

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
    apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt install terraform

RUN curl https://baltocdn.com/helm/signing.asc | apt-key add - && \
    apt-get install apt-transport-https --yes && \
    echo "deb https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list && \
    apt update && \
    apt install helm

RUN apt update && \
    apt install --yes git tmux yarnpkg nodejs npm fzf universal-ctags sudo jq

RUN groupadd developer && \
      useradd -m -s /bin/bash -d /home/developer -g developer developer && \
      echo "%developer ALL=(ALL) NOPASSWD:ALL" | tee /etc/sudoers.d/developer && \
      chmod 440 /etc/sudoers.d/developer

# Switching users and working Directories. Any mounted directories should be in
# here. Treat it like a normal operating system install.
USER developer
WORKDIR /home/developer

ENV PATH=/home/developer/.local/bin:$PATH

# RUN git clone https://github.com/SpaceVim/SpaceVim.git ~/.SpaceVim && \
RUN git clone https://github.com/ajmwagar/vim-deus.git ~/.vim/pack/ajmwagar/start/vim-deus

RUN python -m pip install --upgrade pip && \
      python -m pip install autopep8 flake8 pycodestyle pylint pytest rstcheck yamllint jsonlint && \
      python -m pip install ansible jedi

COPY --chown=developer:developer src/Microsoft.PowerShell_profile.ps1 /home/developer/.config/powershell/Microsoft.PowerShell_profile.ps1

RUN mkdir -p /home/developer/.vim && \
      mkdir -p /home/developer/.config/nvim && \
      mkdir -p /home/developer/.local/share/nvim/shada && \
      touch /home/developer/.local/share/nvim/shada/main.shada

COPY --chown=developer:developer src/init.vim /home/developer/.config/nvim/init.vim

COPY --chown=developer:developer src/vimrc /home/developer/.vim/vimrc

COPY --chown=developer:developer src/vim_setup.sh /vim_setup.sh

COPY --chown=developer:developer src/tmux.conf /home/developer/.tmux.conf

RUN echo "export PATH=/home/developer/.local/bin:${PATH}" | tee -a ~/.bashrc

# Install Python Poetry
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

ENV TERM=xterm-256color

ENTRYPOINT [ "/usr/bin/tmux" ]

CMD ["new-session", "-s", "DevOps", "-n", "Vim", "vim"]
