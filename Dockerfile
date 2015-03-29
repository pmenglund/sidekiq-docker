FROM jruby:1.7-onbuild
ENTRYPOINT ["/usr/local/bundle/bin/sidekiq"]
CMD ["-r", "lib/skalera/sidekiq.rb"]

