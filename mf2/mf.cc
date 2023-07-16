/*
This is the function you need to implement. Quick reference:
- input rows: 0 <= y < ny
- input columns: 0 <= x < nx
- element at row y and column x is stored in in[x + y*nx]
- for each pixel (x, y), store the median of the pixels (a, b) which satisfy
  max(x-hx, 0) <= a < min(x+hx+1, nx), max(y-hy, 0) <= b < min(y+hy+1, ny)
  in out[x + y*nx].
*/

#include <algorithm>
#include <vector>

void mf(int ny, int nx, int hy, int hx, const float *in, float *out)
{

#pragma omp parallel for
  for (int y = 0; y < ny; y++)
  {
    
    for (int x = 0; x < nx; x++)
    {
      // iterate window
      int left = std::max(x - hx, 0);
      int right = std::min(x + hx + 1, nx);
      int down = std::max(y - hy, 0);
      int up = std::min(y + hy + 1, ny);
      std::vector<double> v(abs(right - left) * abs(up - down));
      int count = 0;
      for (int i = left; i < right; i++)
      {
        for (int j = down; j < up; j++)
        {
          v[count] = in[i + j * nx];
          count++;
        }
      }

      // get median
      if (v.size() % 2 == 1)
      {
        auto median_pos = v.begin() + (v.size() - 1) * 0.5;
        std::nth_element(v.begin(), median_pos, v.end());
        out[x + y * nx] = (float)v[(v.size() - 1) * 0.5];
      }
      else
      {
        auto k1 = v.begin() + v.size() * 0.5 - 1;
        std::nth_element(v.begin(), k1, v.end());
        double x_k1 = v[v.size() * 0.5 - 1];

        auto k2 = v.begin() + v.size() * 0.5;
        std::nth_element(v.begin(), k2, v.end());
        double x_k2 = v[v.size() * 0.5];

        out[x + y * nx] = (x_k1 + x_k2) * 0.5;
      }
    }
  }
}
