SRC_DIR = ./src
OUT_DIR = ../src/static/img

.PHONY: build clean

build:
	mkdir -p $(OUT_DIR) && docker run --rm -v $(SRC_DIR):/app -v $(OUT_DIR):/dist -w /app mcr.microsoft.com/playwright:v1.61.1-jammy npx playwright screenshot --viewport-size=1200,630 index.html /dist/og_img.png

clean:
	rm -rf $(OUT_DIR)
