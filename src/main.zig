const std = @import("std");
const c = @import("c.zig");

fn mat4_identity() c.mat4 {
    return [4][4]f32 {
        [4]f32{1.0, 0.0, 0.0, 0.0},
        [4]f32{0.0, 1.0, 0.0, 0.0},
        [4]f32{0.0, 0.0, 1.0, 0.0},
        [4]f32{0.0, 0.0, 0.0, 1.0}
    };
}

pub fn main() anyerror!void {
    const num: f32 = 5.0;
    comptime var translation: c.vec3 = [3]f32{1.0, 0.0, 0.0};
    comptime var translate_mat: c.mat4 = mat4_identity();
    c.glm_translate_make(@ptrCast([*c][4]f32, &translate_mat), @ptrCast([*c]f32, &translation));
    std.debug.warn("{}", translate_mat);
}
