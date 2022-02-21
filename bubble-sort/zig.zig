const std = @import("std");

fn create(allocator: std.mem.Allocator, size: u16) ![]u16 {
    const list = try allocator.alloc(u16, size);
    var i: u16 = 0;

    while (i < size) : (i += 1) {
        list[i] = size - i;
    }

    return list;
}

pub fn main() anyerror!void {
    var i: u16 = 0;
    var j: u16 = 0;
    const allocator = std.heap.page_allocator;
    const list = try create(allocator, 10000);
    defer allocator.free(list);

    while (i < list.len): (i += 1) {
        while (j < list.len - i - 1): (j += 1) {
            if (list[j] > list[j + 1]) {
                const tmp = list[j];
                list[j] = list[j + 1];
                list[j + 1] = tmp;
            }
        }
        j = 0;
    }
}
