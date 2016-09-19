FROM ruby:2.3.1

# Install rbenv
RUN git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv
RUN echo '# rbenv setup' > /etc/profile.d/rbenv.sh
RUN echo 'export RBENV_ROOT=/usr/local/rbenv' >> /etc/profile.d/rbenv.sh
RUN echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile.d/rbenv.sh
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
RUN chmod +x /etc/profile.d/rbenv.sh

# install ruby-build
RUN mkdir /usr/local/rbenv/plugins
RUN git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build

# Setup path
ENV RBENV_ROOT /usr/local/rbenv
ENV PATH $RBENV_ROOT/bin:$RBENV_ROOT/shims:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Set ruby compile options keep docs
ENV RUBY_CONFIGURE_OPTS --enable-install-doc

# Install ruby 2.3.1
RUN rbenv install 2.3.1
RUN rbenv global 2.3.1

# Install rubygems
RUN gem install bundler
RUN rbenv rehash

RUN git clone https://github.com/guiferrpereira/gohiring-challenge.git /code

WORKDIR /code

EXPOSE 8081

ENTRYPOINT ["/code/docker-entrypoint.sh"]
