webpack = node_modules/webpack/bin/webpack.js
jshint = node_modules/jshint/bin/jshint
mocha = node_modules/mocha/bin/mocha
coveralls = node_modules/coveralls/bin/coveralls.js

build:
	@$(webpack)
	@$(webpack) --prod

test:
	@$(mocha) -u tdd -R mocha-spec-cov -r blanket

test-watch:
	@$(mocha) -u tdd -R min -w

lint:
	@jshint lib/*.js

coveralls:
	@$(mocha) -r blanket -u tdd -R mocha-lcov-reporter | $(coveralls)

coverage:
	@$(mocha) -u tdd -R html-cov -r blanket > coverage-report.html

watch:
	@$(mocha) -u tdd -R mocha-spec-cov -r blanket -w

clean:
	@rm -rf build/
	@rm -f coverage-report.html

.PHONY: build clean coverage test watch
