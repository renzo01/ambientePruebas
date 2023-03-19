public class ParkLocator {
    public static List<String> country(String x){
        String parks = x;
        ParkService.ParksImplPort service = new ParkService.ParksImplPort();
        return service.byCountry(parks);
    }
}