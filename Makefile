SASS_DIR = {PROJECT_NAME}/assets/stylesheets
SITE_SCSS = $(SASS_DIR)/site.css.scss
SITE_CSS = {PROJECT_NAME}/static/css/site.css

SASS_FILES = $(shell find {PROJECT_NAME}/assets -iname '*.scss')

.PHONY: all
all: css

.PHONY: clean
clean:
	rm -rf $(SITE_CSS)

.PHONY: test
test:
	./test.sh

.PHONY: run
run:
	./manage.py runserver 0.0.0.0:{PORT_NUMBER}

.PHONY: run_production
run_production:
	script/run_production

.PHONY: css
css: $(SITE_CSS)

$(SITE_CSS): $(SASS_FILES)
	@mkdir -p {PROJECT_NAME}/static/css
	sass $(SITE_SCSS) $(SITE_CSS)

.PHONY: watch
watch:
	@mkdir -p {PROJECT_NAME}/static/css
	sass --watch --poll $(SITE_SCSS):$(SITE_CSS)
