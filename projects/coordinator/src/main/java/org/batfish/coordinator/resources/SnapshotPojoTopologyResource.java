package org.batfish.coordinator.resources;

import com.fasterxml.jackson.databind.JsonNode;
import com.google.common.base.Throwables;
import java.io.IOException;
import javax.annotation.ParametersAreNonnullByDefault;
import javax.ws.rs.GET;
import javax.ws.rs.InternalServerErrorException;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import org.batfish.common.util.BatfishObjectMapper;
import org.batfish.coordinator.Main;
import org.batfish.datamodel.pojo.Topology;

@ParametersAreNonnullByDefault
public final class SnapshotPojoTopologyResource {

  private final String _network;

  private final String _snapshot;

  public SnapshotPojoTopologyResource(String network, String snapshot) {
    _network = network;
    _snapshot = snapshot;
  }

  @GET
  @Produces(MediaType.APPLICATION_JSON)
  public JsonNode get() {
    Topology topology;
    try {
      topology = Main.getWorkMgr().getPojoTopology(_network, _snapshot);
    } catch (IOException e) {
      throw new InternalServerErrorException(Throwables.getStackTraceAsString(e));
    }
    return BatfishObjectMapper.mapper().valueToTree(topology);
  }
}
