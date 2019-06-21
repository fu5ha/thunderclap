const Builder = @import("std").build.Builder;

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();
    const exe = b.addExecutable("thunderclap", "src/main.zig");
    exe.setBuildMode(mode);

    exe.addIncludeDir("stb_image-2.22");
    exe.addIncludeDir("cglm-0.5.4/include");

    const run_cmd = exe.run();

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    b.default_step.dependOn(&exe.step);
    b.installArtifact(exe);
}
