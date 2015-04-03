# -*- mode: ruby -*-
# vi: set ft=ruby :


class Guidedog < Formula
  homepage "https://github.com/9seconds/guidedog"
  # url "https://github.com/9seconds/guide-dog.git", using: :git, :tag => "0.1"
  sha1 ""

  head "https://github.com/9seconds/guidedog.git", using: :git

  bottle do
    sha1 "7563b28df830baa880731b9448e88b99dcb68420" => :mavericks
    sha1 "4ecba686ae851cb091bec58aebab1c092a5edfbf" => :mountain_lion
    sha1 "697f44626b6dd3152fb23d6da8272cb2359a6845" => :lion
  end

  depends_on "go" => :build

  def install
    Dir.mktmpdir("ah") do |dir|
      ENV.prepend_path "GOPATH", dir
      system "go", "get", "github.com/tools/godep"
      ENV.prepend_path "PATH", "#{dir}/bin"

      mkdir_p "#{dir}/src/github.com/9seconds"
      File.symlink(Dir.pwd, "#{dir}/src/github.com/9seconds/guidedog")

      system "make", "build"

      bin.install "guidedog"
    end
  end

  test do
    system "#{bin}/guidedog", "--version"
  end
end
