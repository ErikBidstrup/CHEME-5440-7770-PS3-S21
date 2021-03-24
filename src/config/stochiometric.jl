### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ 9720d140-8bf9-11eb-3391-7da0608d03d5
using DelimitedFiles

# ╔═╡ 5e2a99c0-8c4e-11eb-2261-3596c3b51071
using CSV,DataFrames

# ╔═╡ f7b7af70-8b35-11eb-0f84-0f9081e07bd0
begin
		rxn1 = [-1 0 -1 1 0 0 0 0 0 -1 1 1 0 0 0 0 0 0]'
		rxn2 = [0 0 0 -1 1 1 0 0 0 0 0 0 0 0 0 0 0 0]'
		rxn3 = [0 0 0 0 0 -1 1 1 0 0 0 0 -1 0 0 0 0 0]'
		rxn4 = [0 -1 1 0 0 0 0 -1 1 0 0 0 0 0 0 0 0 0]'
		rxn5f = [0 0 2 0 0 -2 0 0 0 0 0 0 4 -4 -3 -3 2 3]'
		rxn5r = rxn5f.*-1
		trans1 = [0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]'
		trans2 = [1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]'
		trans3 = [0 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 0 0]'
		trans4 = [0 0 0 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0]'
		trans5 = [0 0 0 0 0 0 0 0 -1 0 0 0 0 0 0 0 0 0]'
		trans6 = [0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0]'
		trans7 = [0 0 0 0 0 0 0 0 0 0 -1 0 0 0 0 0 0 0]'
		trans8 = [0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0 0 0 0]'
		trans9 = [0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0]'
		trans10 = trans9.*-1
		trans11 = [0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0]'
		trans12 = trans11.*-1
		trans13 = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0]'
		trans14 = trans13.*-1
		trans15 = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0]'
		trans16 = trans15.*-1
		trans17 = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0]'
		trans18 = trans17.*-1
		trans19 = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1]'
		trans20 = trans19.*-1	
			
	s = hcat(rxn1,rxn2,rxn3,rxn4,rxn5f,rxn5r,trans1,trans2,trans3,trans4,trans5,trans6,trans7,trans8,trans9,trans10,trans11,trans12,trans13,trans14,trans15,trans16,trans17,trans18,trans19,trans20)
	print(s)
end

# ╔═╡ 84d03cd0-8c1a-11eb-0038-7717a9b98516
begin
	abc = open("notes.txt","w")
	writedlm(abc,s)
	close(abc)
	# the file f is automatically closed after this block finishes
end

# ╔═╡ ea9aa420-8b5b-11eb-399a-11706b03ddb8
# Checking elemental balances
s_rxn = s[:,1:6]


# ╔═╡ 04f6d650-8c50-11eb-2209-1b64eefbb63b
# reading the csv file 
	d = CSV.read("C:\\Users\\bidst\\Google Drive\\Dropbox\\Documents\\School\\PhD Classes\\Chem_Eng 7770\\HW\\PS 3\\element_matrix_construction.csv",DataFrame)

# ╔═╡ 8ad9457e-8cbb-11eb-3748-bfdfeab03d9a
d_rxn = convert(Matrix, d[1:end-1,2:end])

# ╔═╡ 01f07c10-8cbc-11eb-30d7-4d4a4f9b5f38
elementcheckmatrix = d_rxn*s_rxn

# ╔═╡ 320b5ce0-8cca-11eb-3114-b720968e1f69
(number_of_species,number_of_reactions) = size(s)

# ╔═╡ 38d1ad40-8cca-11eb-2a57-49fcb30fef66
flux_bounds_array = zeros(number_of_reactions,2)

# ╔═╡ 31b107e0-8cca-11eb-00d9-71a89a9fe579
# TODO: update the flux_bounds_array for each reaction in your network
	# TODO: col 1 => lower bound
	for i = 7:number_of_reactions
		flux_bounds_array[i,1] = 0
	end

# ╔═╡ 9f2e34a0-8cca-11eb-2e74-8be8540ab6e4
# # TODO: col 2 => upper bound
	for i = 7:number_of_reactions
	 	flux_bounds_array[i,2] = 0.001
	end

# ╔═╡ 45013990-8ccb-11eb-1588-1d306cfaf616
flux_bounds_array

# ╔═╡ Cell order:
# ╠═f7b7af70-8b35-11eb-0f84-0f9081e07bd0
# ╠═9720d140-8bf9-11eb-3391-7da0608d03d5
# ╠═84d03cd0-8c1a-11eb-0038-7717a9b98516
# ╠═ea9aa420-8b5b-11eb-399a-11706b03ddb8
# ╠═5e2a99c0-8c4e-11eb-2261-3596c3b51071
# ╠═04f6d650-8c50-11eb-2209-1b64eefbb63b
# ╠═8ad9457e-8cbb-11eb-3748-bfdfeab03d9a
# ╠═01f07c10-8cbc-11eb-30d7-4d4a4f9b5f38
# ╠═320b5ce0-8cca-11eb-3114-b720968e1f69
# ╠═38d1ad40-8cca-11eb-2a57-49fcb30fef66
# ╠═31b107e0-8cca-11eb-00d9-71a89a9fe579
# ╠═9f2e34a0-8cca-11eb-2e74-8be8540ab6e4
# ╠═45013990-8ccb-11eb-1588-1d306cfaf616
