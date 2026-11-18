// Graph-paper texture for Ghostty (Shadertoy-style)

const float CELL        = 28.0;  // grid square size in pixels
const float LINE_STRENGTH  = 0.07; // how dark the grid lines are
const float GRAIN_STRENGTH = 0.06; // fine paper grain
const float FIBER_STRENGTH = 0.03; // soft large-scale mottling
const vec3  TINT = vec3(1.0, 0.985, 0.94); // slight warm cast

float hash(vec2 p) {
    p = fract(p * vec2(123.34, 456.21));
    p += dot(p, p + 45.32);
    return fract(p.x * p.y);
}

float vnoise(vec2 p) {
    vec2 i = floor(p), f = fract(p);
    f = f * f * (3.0 - 2.0 * f);
    float a = hash(i);
    float b = hash(i + vec2(1.0, 0.0));
    float c = hash(i + vec2(0.0, 1.0));
    float d = hash(i + vec2(1.0, 1.0));
    return mix(mix(a, b, f.x), mix(c, d, f.x), f.y);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord / iResolution.xy;
    vec4 term = texture(iChannel0, uv);

    // Grid: distance (in px) to the nearest horizontal/vertical line
    vec2 g = abs(fract(fragCoord / CELL + 0.5) - 0.5) * CELL;
    float d = min(g.x, g.y);
    float line = 1.0 - smoothstep(0.5, 1.5, d);

    // Paper grain (per-pixel) and soft mottling (low frequency)
    float grain = hash(fragCoord) ;
    float fibers = vnoise(fragCoord / 40.0) * 0.6 + vnoise(fragCoord / 9.0) * 0.4;

    float paper = 1.0
        - line   * LINE_STRENGTH
        - grain  * GRAIN_STRENGTH
        - fibers * FIBER_STRENGTH;

    fragColor = vec4(term.rgb * paper * TINT, term.a);
}
