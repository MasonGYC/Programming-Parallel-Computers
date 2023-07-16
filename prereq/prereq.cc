struct Result
{
    float avg[3];
};

/*
This is the function you need to implement. Quick reference:
- x coordinates: 0 <= x < nx
- y coordinates: 0 <= y < ny
- horizontal position: 0 <= x0 < x1 <= nx
- vertical position: 0 <= y0 < y1 <= ny
- color components: 0 <= c < 3
- input: data[c + 3 * x + 3 * nx * y]
- output: avg[c]
*/
Result calculate(int ny, int nx, const float *data, int y0, int x0, int y1, int x1)
{
    Result result{{0.0f, 0.0f, 0.0f}};
    double r1 = 0;
    double g1 = 0;
    double b1 = 0;
    double r2 = 0;
    double g2 = 0;
    double b2 = 0;
    for (int i = x0; i < x1; i = i + 2)
    {
        for (int j = y0; j < y1; j = j + 1)
        {
            r1 = r1 + data[0 + 3 * i + 3 * nx * j];
            g1 = g1 + data[1 + 3 * i + 3 * nx * j];
            b1 = b1 + data[2 + 3 * i + 3 * nx * j];
        }
    }

    for (int i = x0 + 1; i < x1; i = i + 2)
    {
        for (int j = y0; j < y1; j = j + 1)
        {
            r2 = r2 + data[0 + 3 * i + 3 * nx * j];
            g2 = g2 + data[1 + 3 * i + 3 * nx * j];
            b2 = b2 + data[2 + 3 * i + 3 * nx * j];
        }
    }
    double num_pixels = (double)(x1 - x0) * (y1 - y0);
    result.avg[0] = (float)(r1 + r2) / num_pixels;
    result.avg[1] = (float)(g1 + g2) / num_pixels;
    result.avg[2] = (float)(b1 + b2) / num_pixels;
    return result;
}
