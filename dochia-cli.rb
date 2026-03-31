# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class DochiaCli < Formula
  desc "Dochia automatically generates and executes negative and boundary testing so you can focus on creative problem-solving."
  homepage "https://dochia.dev"

  if OS.mac?
      if Hardware::CPU.intel?
        url "https://github.com/dochia-dev/dochia-cli/releases/download/dochia-cli-2.1.0/dochia-cli_macos_amd64_2.1.0.tar.gz"
        sha256 "bd534b2c8c9c8cdcb0563cda663be59363340a454a67678631749b6635e4b423"
      elsif Hardware::CPU.arm?
        url "https://github.com/dochia-dev/dochia-cli/releases/download/dochia-cli-2.1.0/dochia-cli_macos_arm64_2.1.0.tar.gz"
        sha256 "7b3442ccf992a2a1e14c225c390abe571363cf97dd99a21c8b59c9b71d091625"
      end
  elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/dochia-dev/dochia-cli/releases/download/dochia-cli-2.1.0/dochia-cli_linux_amd64_2.1.0.tar.gz"
        sha256 "5166d170a653bf4a7a94b07c609db0ccca14b9b04b7cebe9ab849c3e19a79f83"
      elsif Hardware::CPU.arm?
        url "https://github.com/dochia-dev/dochia-cli/releases/download/dochia-cli-2.1.0/dochia-cli_linux_arm64_2.1.0.tar.gz"
        sha256 "d8367d51f9f59eab5bdbe2cb7126a797c69bf01f849aefa3d3cac7a976ebb2c3"
      end
  else
    odie "Please use the uberjar version: https://github.com/dochia-dev/dochia-cli/releases/download/dochia-cli-2.1.0/dochia-cli_uberjar_2.1.0.tar.gz"
  end

  license "Apache-2.0"

  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "./configure", *std_configure_args, "--disable-silent-rules"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    bin.install 'dochia'
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test sol`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
