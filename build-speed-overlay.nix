# The "Rewrite Symlinks" hook takes multiple seconds to run as many symlinks are created so we disable it
(final: prev: {
  wrapNeovimUnstable = unwrapped: args: (prev.wrapNeovimUnstable unwrapped args).overrideAttrs {
    # dontRewriteSymlinks = true; # Disable just the symlink rewrite phase
    fixupPhase = ''echo "Skipping fixup phase 🚀🚀🚀 :)"''; # Nuclear option for a little more speed
  };
})
