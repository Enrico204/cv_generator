.PHONY: clean all

all: out/cv.pdf out/cv-europass.pdf out/cv_public.pdf out/cv-europass_public.pdf

out/cv.pdf: cv/cv.latex cv.md
	mkdir -p out/
	pandoc cv.md --template=cv/cv.latex -s -o out/cv.pdf

out/cv-europass.pdf: cv/europass.latex cv.md
	mkdir -p out/
	pandoc cv.md --template=cv/europass.latex -s -o out/cv-europass.pdf

out/cv_public.pdf: cv/cv.latex cv.md
	mkdir -p out/
	pandoc cv.md --template=cv/cv.latex -s -V public-cv -o out/cv_public.pdf

out/cv-europass_public.pdf: cv/europass.latex cv.md
	mkdir -p out/
	pandoc cv.md --template=cv/europass.latex -s -V public-cv -o out/cv-europass_public.pdf

clean:
	rm -rf out/
