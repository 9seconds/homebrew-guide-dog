# This is a docker file to test if Brew works.

FROM sjackman/linuxbrew
MAINTAINER 9seconds <nineseconds@yandex.ru>

# Make sure everything is up to date.
RUN brew update && brew upgrade

# Add repository as a tap and inject current directory.
RUN brew tap 9seconds/homebrew-guide-dog && \
    rm -rf /home/linuxbrew/.linuxbrew/Library/Taps/9seconds/homebrew-guide-dog
ADD . /home/linuxbrew/.linuxbrew/Library/Taps/9seconds/homebrew-guide-dog

# Do all possible installations.
#RUN brew install -vd guidedog --HEAD
