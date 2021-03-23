### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ 9720d140-8bf9-11eb-3391-7da0608d03d5
using DelimitedFiles

# ╔═╡ f7b7af70-8b35-11eb-0f84-0f9081e07bd0
begin
		rxn1 = [-1 0 -1 1 0 0 0 0 0 -1 1 1 0 0 0 0 0 0]'
		rxn2 = [0 0 0 -1 1 1 0 0 0 0 0 0 0 0 0 0 0 0]'
		rxn3 = [0 0 0 0 0 -1 1 1 0 0 0 0 -1 0 0 0 0 0]'
		rxn4 = [0 -1 1 0 0 0 0 -1 1 0 0 0 0 0 0 0 0 0]'
		rxn5f = [0 0 1 0 0 -1 0 0 0 0 0 0 2 -4 -3 -3 2 1]'
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
begin
	tau_d = 20*3600		
	E = 0.01*10^(-6)
	kcat1 = 249
	kcat2 = 88.1
	kcat3 = 34.5
	kcat4 = 203
	kcat5 = 13.7
end

# ╔═╡ Cell order:
# ╠═f7b7af70-8b35-11eb-0f84-0f9081e07bd0
# ╠═9720d140-8bf9-11eb-3391-7da0608d03d5
# ╠═84d03cd0-8c1a-11eb-0038-7717a9b98516
# ╠═ea9aa420-8b5b-11eb-399a-11706b03ddb8
