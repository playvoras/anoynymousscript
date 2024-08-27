local bit32 = table.clone(bit32)
bit32.byteswap = function(value)
	local b1 = bit32.extract(value, 0, 8)
	local b2 = bit32.extract(value, 8, 8)
	local b3 = bit32.extract(value, 16, 8)
	local b4 = bit32.extract(value, 24, 8)
	return bit32.bor(
		bit32.lshift(b1, 24),
		bit32.lshift(b2, 16),
		bit32.lshift(b3, 8),
		b4
	)
end
