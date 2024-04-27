public class F extends C {

    private String b = "hello";

    private String c = "init";

    public int hh() {
        return new java.util.Random(10).nextInt(10);
    }

    public java.lang.Class qq() {
        return getClass();
    }

    public double ad() {
        return java.lang.Math.sqrt(13);
    }

    public void ab() {
        return;
    }
<<<<<<< .working

    public int[] ii() {
        return new int[]{4, 3, 2, 1};
    }

    public java.util.List<String> jj() {
        return new java.util.ArrayList<String>();
    }
||||||| .merge-left.r7
=======

    public int[] ii() {
        return new int[]{4, 3, 2, 1};
    }

    public java.util.List<String> jj() {
        return new java.util.ArrayList<String>();
    }

    public Object pp() {
        return this;
    }
>>>>>>> .merge-right.r18
}
