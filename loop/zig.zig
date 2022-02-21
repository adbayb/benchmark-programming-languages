const std = @import("std");

pub fn main() !void {
    const size = 100000;
    var i: usize = 0;
    var value = i;

    while (i < size) : (i += 1) {
        value = i;
    }

    std.debug.print("{}\n", .{value});
}
