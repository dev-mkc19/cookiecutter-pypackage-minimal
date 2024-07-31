

compile:
	@(SOURCE_DIR=$(basename $(PWD)) ZIP=cookiecutter.zip && echo "Set variables" \
	&& pushd .. \
	&& echo "Set parent directory as working directory" \
	&& zip -r $$ZIP $$SOURCE_DIR --exclude $$SOURCE_DIR/$$ZIP --quiet \
	&& echo "ZIP cookiecutter" \
	&& mv $$ZIP $$SOURCE_DIR/$$ZIP \
	&& echo "Move ZIP to original directory" \
	&& popd \
	&& echo "Restore original work directory" \
	&& echo "Cookiecutter full path: $(pwd)/$$SOURCE_DIR/$$ZIP")

test: compile
	cookiecutter $(PWD)/cookiecutter.zip -o ./test

clear:
	rm cookiecutter.zip
	rm -R ./test
