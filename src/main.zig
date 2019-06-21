const std = @import("std");
const c = @import("c.zig");

pub fn main() anyerror!void {
    const num: f32 = 5.0;
    var translation: c.vec3 = f32[4]{1.0, 0.0, 0.0};
    var translate_mat: c.mat4 = undefined;
    c.glm_translate_make(translate_mat, translation);
    std.debug.warn("{}", num);
}
