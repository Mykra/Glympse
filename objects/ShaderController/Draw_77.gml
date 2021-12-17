if (global.phase == 1){
	shader_set(invert);
}
draw_surface(application_surface, 0, 0);
shader_reset();