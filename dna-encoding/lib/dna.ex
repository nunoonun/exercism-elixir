defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
      32 -> 0b0000
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
      0b0000 -> 32
    end
  end

  def encode(dna) do
    encode(dna, <<>>)
  end

  defp encode([], encode), do: encode
  defp encode([head | tail], <<>>) do
    nucleotide = DNA.encode_nucleotide(head)
    bit_nucleotide = <<nucleotide::4>>
    encode(tail, <<bit_nucleotide::bitstring>>)
  end
  defp encode([head | tail], encoded) do
    nucleotide = DNA.encode_nucleotide(head)
    bit_nucleotide = <<nucleotide::4>>
    encode(tail, <<encoded::bitstring, bit_nucleotide::bitstring>>)
  end

  def decode(dna) do
    decode(dna, '')
  end

  defp decode(<<>>, decoded), do: decoded
  defp decode(<<bit_nucleotide::4, tail::bitstring>>, []) do
    nucleotide = DNA.decode_nucleotide(bit_nucleotide)
    decode(tail, [nucleotide])
  end
  defp decode(<<bit_nucleotide::4, tail::bitstring>>, decoded) do
    nucleotide = DNA.decode_nucleotide(bit_nucleotide)
    decode(tail, decoded ++ [nucleotide])
  end
end
