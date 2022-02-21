const std = @import("std");

pub fn main() anyerror!void {
    var file = try std.fs.cwd().openFile("assets/unsplash.jpg", .{ .read = true });
    defer file.close();

    const size = try file.getEndPos();
    const allocator = std.heap.page_allocator;
    const buffer = try allocator.alloc(u8, size);
    defer allocator.free(buffer);

    const bytesRead = try file.readAll(buffer);
    std.debug.print("Bytes read: {}\n", .{bytesRead});
}
