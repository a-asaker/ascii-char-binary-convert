#!/usr/bin/ruby

def usage
	puts """ [#] ASCII-Character-Binary Converter By A_Asaker.
 [-] Usage : ./acb_conv.rb [option] [data]
 [*] Options : 
 	 -a : Converts ASCII To Char And Binary,
		  Data Should Be Integers.
	 -c : Converts Char To ASCII,Binary.
		  Data Should Be Characters.
	 -b : Converts Binary To Char And ASCII,
		  Data Should Be binary.
 [~] Examples :
 	      ~ ./acb_conv.rb -a 67 34 546
  	    ~ ./acb_conv.rb -c a 3 $
	      ~ ./acb_conv.rb -a 234 52 
	      ~ ./acb_conv.rb -b 110100 1001000 101101"""
	exit
end

def print_table(from_val,to_val,bin)
	puts"\t|\t #{from_val}\t |\t #{to_val}\t |\t  #{bin}\t|
\t+----------------+---------------+----------------------+"
end

def char_to_ascii
		puts"\t+================+===============+======================+"
	puts "\t|\tChar\t |\tAscii\t |\t  Binary\t|"
		puts"\t+================+===============+======================+"
	for value in ARGV.to_a[1..ARGV.length-1]
		begin
			(value.length > 1)? raise:
			print_table(value,value.ord,value.ord.to_s(2))	
		rescue Exception => e
			print_table(value,"Invalid Char","")
		end
	end
end

def ascii_to_char
	puts"\t+================+===============+======================+"
	puts "\t|\tAscii\t |\tChar\t |\t  Binary\t|"
	puts"\t+================+===============+======================+"
	for value in ARGV.to_a[1..ARGV.length-1]
		begin
			(value.to_i==0)? raise: ""
			(':'..'z').each {|char| (value.include?(char.chr)) ? raise : ""}
			print_table(value,value.to_i.chr,value.to_i.to_s(2))			
		rescue Exception => e
			print_table(value,"Invalid Ascii","")
		end
	end
end

def bin_to_char
		puts"\t+========================+==============================+"
	puts "\t|\t  Binary\t |\tAscii\t |\tChar\t|"
		puts"\t+========================+==============================+"
	for value in ARGV.to_a[1..ARGV.length-1]
		begin
			('2'..'z').each {|char| (value.include?(char.chr)) ? raise : ""}
			print_table(value,value.to_i(2),value.to_i(2).chr)			
		rescue Exception => e
			print_table(value,"Invalid Binary","")
		end
	end
end

(ARGV.length<2)? usage: ""
char_to_ascii if ARGV.each.to_a.include?("-c")
(ARGV.each.to_a.include?"-a")? (ascii_to_char) : ""
bin_to_char if ARGV.each.to_a.include?("-b")
