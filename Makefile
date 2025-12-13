# Ý Tưởng:
# - Các file MD trong thư mục content sẽ được chuyển thành file TYP tương ứng.
# - Makefile sẽ tự động tạo lại file TYP nếu file MD thay đổi.
# - Makefile sẽ tự động tạo lại file PDF nếu file TYP thay đổi.

# Định nghĩa danh sách file nguồn và file đích
MD_CHAPTERS := $(wildcard content/*.md)
TYP_CHAPTERS := $(MD_CHAPTERS:.md=.typ)

.PHONY: all clean

all: main.pdf slides.pdf

# Rule để tạo file .typ từ .md
# $< là file input, $@ là file output
%.typ: %.md
	pandoc -f markdown -t typst "$<" -o "$@"

# main.pdf phụ thuộc vào main.typ VÀ tất cả các file typ trong content
# Nếu file .md thay đổi -> make tự động tạo lại .typ -> sau đó tạo lại .pdf
main.pdf: main.typ $(TYP_CHAPTERS)
	typst compile main.typ

# Tương tự cho slides
slides.pdf: slides.typ contents.typ
	typst compile slides.typ

contents.typ: contents.md
	pandoc -f markdown -t typst contents.md -o contents.typ

clean:
	rm -f main.pdf slides.pdf
	# rm -f content/*.typ contents.typ
