//
// City "selection" rendering 
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec3 in_Normal;                    // (nx,ny,nz)     
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;

    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// City "selection" rendering 
//
varying vec2    v_vTexcoord;
varying vec4    v_vColour;

void main()
{
    // get a pixel from the tile, and set the pixel colour for drawing with
    vec4 pix = texture2D( gm_BaseTexture, v_vTexcoord );
    gl_FragColor = pix;

    // Do alpha test (not available as a global state in WebGL)
    if (pix.a < ((1.0/255.0)*250.0) ) discard; //<= (1.0/253.0)) discard;
}

