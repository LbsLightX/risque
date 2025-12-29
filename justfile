default: build

prefix := 'dist'

dev:
  @just clean
  zola serve -p 3000 --drafts

build:
  @just clean
  ./ascii.sh
  zola build

clean:
  rm -rf public/

push:
  @just build
  rsync -avz --delete --chmod=D755,F644 public/ ebil.club:.

copy:
  mkdir -p {{prefix}}
  cp -r public/* {{prefix}}

lint:
  typos content/**/*

lint-fix:
  typos content/**/* -w
