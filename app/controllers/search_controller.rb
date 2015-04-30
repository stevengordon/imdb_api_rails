class SearchController < ApplicationController

	def index
		search_params = params[:q]
		if search_params != nil && search_params != ""
			# get here if there IS a search param in URL

			api_url = "http://www.omdbapi.com"

			# THIS HANDLES MULTI WORD SEARCH TERMS CORRECTLY.  Better than trying to "rebuild" the URL by hand

			api_resp = Typhoeus.get(api_url, params: { s: search_params})

			resp_JSON = JSON.parse(api_resp.body)

			@results = resp_JSON["Search"]

			#render text: @results
		else
			# do nothing -- just render regular empty page
			@results = {}
			#@results = {"Title": "No Movie Found","imdbID": "NA"}
		end
	end

	def results
		#
	end

	def movie
		if params[:imdbID] != nil

			api_url = "http://www.omdbapi.com"

			# THIS HANDLES MULTI WORD SEARCH TERMS CORRECTLY.  Better than trying to "rebuild" the URL by hand

			api_resp = Typhoeus.get(api_url, params: { i: params[:imdbID]})

			resp_JSON = JSON.parse(api_resp.body)

			@result = resp_JSON

		else
			@result = {}

		end
	end

end
